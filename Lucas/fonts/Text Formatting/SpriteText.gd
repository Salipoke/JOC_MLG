tool
class_name SpriteText
extends ReferenceRect

# Original plugin by FabianLC
# Improved version by Dark Peace (Bottled Up Studio)
# Modifications made for my RPG Bullethell Dojordin

var animate = false;
var anim_timer = 0;
var anim_timer_i:int = 0;
var a = FontModule.new()
 
export(String, MULTILINE) var text = "#C03color #Wanimation #F_font" setget set_text,get_text;
export(String) var character_set = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ àâèéêëîïôûùç\'"#.;:,?!&(){}[]<>/-_°€+*=1234567890';
var _text = "";
var no_command_text = ""
export var visible_characters:int = -1 setget set_visible_chars,get_visible_chars;
# you can add more fonts in this dictionnary
export var fonts:Dictionary = {"Normal": FontModule.new(), "Mini": FontModule.new(), "Maxi": FontModule.new(),
"Sousligne": FontModule.new(),"Surligne": FontModule.new(),"Italic": FontModule.new(), "Barre": FontModule.new(), "Scribbles": FontModule.new(),"Gibberish": FontModule.new(), "Glitch": FontModule.new()}

# animation customisable parameters
export var anim_speed:float = 120;
export var anim_amplitude:float = 1;
var anim_id:int = 0;

export var tab_spaces:int = 2;
var char_map:Dictionary;
var can_draw:bool = false;
var has_char_map = false;
export var texture_rows:int = 10 setget set_texture_rows, get_texture_rows;
var wchars;
var hchars;
var rng = RandomNumberGenerator.new();

var colors = [];
var rainbow_index = 510
var rainbow = preload("res://Lucas/fonts/Text Formatting/RainbowGradient.tres")
# add the path to your rainbow gradient (there is one included in the plugin)

export var char_width:int = 8
export var char_height:int = 18
export var curr_font:Texture = load("res://Lucas/fonts/Text Formatting/Font Normal.png")
# drop your standart font in font["Normal"] and curr_font or else it could bug

func _ready():
	char_width = fonts["Normal"].get("char_width")
	char_height = fonts["Normal"].get("char_height")
	curr_font = fonts["Normal"].get("font")
	_text = text;
	set_process(true);
	if fonts["Normal"].get("font") != null:
		can_draw = true;
		setup();

func stop():
	set_process(false);
	can_draw = false
	anim_id = 0

func clear_text():       # return a text without the #commands
	no_command_text = ""
	var length = _text.length();
	var ci:int = 0;
	while ci < length:
		while _text[ci] == "#":
			ci += 1
			if _text[ci] in ["F","P"]: ci += 1
			elif _text[ci] == "C": ci += 2
			ci += 1
		no_command_text += _text[ci]
		ci += 1

# just a fonction used in my game, not used in the plugin
func clear_most_text():
	var res = ""
	var length = _text.length();
	var ci:int = 0;
	while ci < length:
		while _text[ci] == "#" and not _text[ci+1] in "rt":
			ci += 1
			if _text[ci] in ["F","P"]: ci += 1
			elif _text[ci] == "C": ci += 2
			ci += 1
		res += _text[ci]
		ci += 1
	return res

func set_text(var txt):
	text = txt;
	clear_text()
	
	if !is_inside_tree():
		return;
	_ready();
	update();

func get_text():
	return text;
	
func set_visible_chars(var value):
	visible_characters = value;
	if !is_inside_tree():
		return;
	_ready();
	update();
	
func get_total_character_count():
	return no_command_text.length()
	
func get_texture_rows():
	return texture_rows;
	
func set_texture_rows(v):
	texture_rows = max(0,v);
	if !is_inside_tree():
		return;
	_ready();
	update();

func get_visible_chars():
	return visible_characters;

func setup():
	var font_w:int = curr_font.get_width();
	var font_h:int = curr_font.get_height();
	wchars = font_w/char_width;
	hchars = font_h/char_height;
	# add or modify the colors you want here
	colors.resize(32);
	colors[0] = Color.black;
	colors[1] = Color.yellow;
	colors[2] = Color.green;
	colors[3] = Color.blue;
	colors[4] = Color.red;
	colors[5] = Color.darkgreen;
	colors[6] = Color.brown;
	colors[7] = Color.blueviolet;
	colors[8] = Color.cyan;
	colors[9] = Color.burlywood; #beige
	colors[10] = Color.orange;
	colors[11] = Color.crimson;
	colors[12] = Color.pink;
	colors[13] = Color(); #rainbow
	colors[14] = Color.darkcyan;
	colors[15] = Color.gray;
	colors[16] = Color.darkgray;
	colors[17] = Color.darkkhaki;
	colors[18] = Color.khaki;
	colors[19] = Color.maroon;
	colors[20] = Color.darkorange;
	colors[21] = Color.darkred;
	colors[22] = Color.darkviolet;
	colors[23] = Color(0,0,0,.5); #transparent
	colors[24] = Color.teal;
	colors[25] = Color.olive;
	char_map = Dictionary();
	var cid = 0;
	for c in character_set:
		char_map[c] = cid;
		cid += 1;

func _process(delta):    # animated text is re-drawn every frame
	if animate:
		anim_timer += anim_speed*delta;
		anim_timer_i = floor(anim_timer);
		update();
	else: anim_timer = 0;

func _draw():
	clear_text()
	var x:int = 0;
	var y:int = 0;
	var i:int = 0;
	var j:int = 0;
	var total = 0;
	var ox = 0;
	var oy = 0;
	
	var length = _text.length();
	var ci:int = 0;
	var no_com_ci:int = 0;
	var col = colors[0];
	var has_anim = false;
	anim_id = 0;
	while ci < length:
		var c = _text[ci];
		var ch_id = char_map.get(c,-1);
		if ch_id == -1 or c == "#":      # looks for commands
			if c == '\n':
				i = 0;
				j += 1;
			elif c == '\t':
				i += tab_spaces;
				if i > floor(rect_size.x/char_width)-1:
					j += 1;
					i = 0;
			elif c == '#' && ci+1 < length:
				var fx_char = _text[ci+1];
				if (ci+3) < length && fx_char == 'C':    # color command
					var num = str(_text[ci+2])+str(_text[ci+3]);
					var numI = num.to_int();
					if numI < colors.size():
						col = colors[numI];
						if numI == 13:     # rainbow command
							animate = true # rainbow is an animation
							col = rainbow.interpolate(rainbow_index)
							rainbow_index += .01
							if rainbow_index >= 1: rainbow_index = 0
						ci += 3;
				elif fx_char == '#':   # TODO fix that : ## must display #
					ch_id = char_map.get('¬',-1)
					ci += 1;
				elif fx_char == '0':   # remove all formatting
					anim_id = 0
					ci += 1;
					col = colors[0]
					curr_font = fonts["Normal"].get("font")
					char_height = fonts["Normal"].get("char_height")
					char_width = fonts["Normal"].get("char_width")
				elif fx_char == 'N': # stop animation
					anim_id = 0;
					ci += 1;
				elif fx_char == 'W': # Wavy text
					anim_id = 1;
					has_anim = true;
					ci += 1;
				elif fx_char == 'S': # Shakey text
					anim_id = 2;
					has_anim = true;
					ci += 1;
				elif fx_char == 'F': # change font : add your fonts here or change the #Fx command
					var selected_font = "Normal"
					# ex: #F_ will change the font to underlined
					# TODO : fix positionning bug with Mini, Maxi and Italic
					match _text[ci+2]:
						"/","N": selected_font = "Normal"
						"m": selected_font = "Mini"
						"M": selected_font = "Maxi"
						"_": selected_font = "Sousligne"
						"S":
							if col == Color.black: col = Color.white
							selected_font = "Surligne"
						"i": selected_font = "Italic"
						"-": selected_font = "Barre"
						"g": selected_font = "Gibberish"
						"G": selected_font = "Glitch"
						"s": selected_font = "Scribbles"
					curr_font = fonts[selected_font].get("font")
					char_height = fonts[selected_font].get("char_height")
					char_width = fonts[selected_font].get("char_width")
					ci += 2;
				# these two are only used in my game
				elif fx_char in 'r': ci += 1;
				elif fx_char in 't': ci += 2;
			ci += 1;
			continue;
		else: no_com_ci += 1
		ox = 0;
		oy = 0;
		y = floor(ch_id/wchars);
		x = ch_id%wchars;

		match anim_id:  # change the letter position for the animation
			1:
				oy = cos((anim_timer + ci * char_height) / char_height);
			2:
				oy = (rng.randi_range(-1,1))*anim_amplitude;
				ox = (rng.randi_range(-1,1))*anim_amplitude;
		
		total = total +1;
		if visible_characters >= 0 && total > visible_characters:
			break;
		# draw the letter
		draw_texture_rect_region(curr_font,Rect2(i*char_width + ox,j*char_height + oy,char_width,char_height),Rect2(x*char_width,y*char_height,char_width,char_height),col,false);
		i += 1;
		
		# autowrap
		var t_lenght = int(floor(rect_size.x/char_width))
		t_lenght = (j+1)*t_lenght
		if c == ' ':
			var next_space = no_command_text.find(" ", no_com_ci+1)
			if next_space == -1: next_space = no_command_text.length()
			if t_lenght < next_space:
				j += 1;
				i = 0;
				if j*char_height > rect_size.y-char_height:
					break;
		
		ci += 1;
		
	if has_anim:
		animate = true;

