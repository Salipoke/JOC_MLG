extends Label
var lvl = []
var boss_lvl = []
var lvl_i = ''
var actual_string = 0
var x = 0
var check_timer = false
var level_selected_animation = true
func _ready():
	for i in range(1,16):
		if i > 9:
			lvl_i = ('res://Lucas/Scenes/Nivells/{i}/nivell_{i}_main.tscn')
			actual_string = lvl_i.format({"i": i})
		else:
			lvl_i = ('res://Lucas/Scenes/Nivells/0{i}/nivell_{i}_main.tscn')
			actual_string = lvl_i.format({"i": i})
		lvl.append(actual_string)
	for i in range(1,4):
		var lvl_i_boss = ('res://Lucas/Scenes/boss_{i}/nivell_boss_{i}_main.tscn')
		var actual_string = lvl_i_boss.format({"i": i})
		boss_lvl.append(actual_string)
#	print (lvl,boss_lvl,'\n\n')
	randomize()
	lvl.shuffle()
	print(lvl)

func _input(event:InputEvent):
	if event is InputEventKey and event.is_action_pressed("ui_home"):
			get_tree().change_scene("res://start.tscn")


func _on_Timer_timeout():
	if check_timer == false:
		check_timer = true
	else:
		get_tree().change_scene(lvl[0])


func _on_Timer2_timeout():
	if check_timer == false:
		if x == 15:
			x = 0
		text = lvl[x]
		x += 1
	else:
		if level_selected_animation == true:
			text = lvl[x]
			level_selected_animation = false
		else:
			text = ''
			level_selected_animation = true
		
