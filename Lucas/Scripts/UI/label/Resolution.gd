extends Label
#EL BOTÓ PER TORNAR AL JOC SENSE PREMER ESC
onready var viewport = get_viewport()

var minimum_size = Vector2(1024,600)

func _ready():
	viewport.connect("size_changed", self, "window_resize")
	window_resize()
	
func _input(event:InputEvent):
	if event is InputEventMouseButton and event.pressed:
		var bounds = Rect2(rect_position,rect_size)
		if bounds.has_point(event.position):
			if OS.window_fullscreen == true:
				OS.window_fullscreen = false
				text = 'FULLSCREEN : OFF'
			else:
				OS.window_fullscreen = true
				text = 'FULLSCREEN : ON'

func window_resize():
	var current_size = OS.get_window_size()

	var scale_factor = minimum_size.y/current_size.y
	var new_size = Vector2(current_size.x*scale_factor, minimum_size.y)

	if new_size.y < minimum_size.y:
		scale_factor = minimum_size.y/new_size.y
		new_size = Vector2(new_size.x*scale_factor, minimum_size.y)
	if new_size.x < minimum_size.x:
		scale_factor = minimum_size.x/new_size.x
		new_size = Vector2(minimum_size.x, new_size.y*scale_factor)

	viewport.set_size_override(true, new_size)
