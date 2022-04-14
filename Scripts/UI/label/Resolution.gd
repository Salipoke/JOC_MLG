extends Label
#EL BOTÓ PER TORNAR AL JOC SENSE PREMER ESC

func _input(event:InputEvent):
	if event is InputEventMouseButton and event.pressed:
		var bounds = Rect2(rect_position,rect_size)
		if bounds.has_point(event.position):
			if OS.window_fullscreen == true:
				OS.window_fullscreen = false
				text = 'FULLSCREEN : OFF'
			else:
				OS.window_fullscreen = true
				OS.set_window_size(Vector2(1080,920))
				text = 'FULLSCREEN : ON'
