extends Label
#EL BOTÓ PER TORNAR AL JOC SENSE PREMER ESC

func _input(event:InputEvent):
	if event is InputEventMouseButton and event.pressed:
		var bounds = Rect2(rect_position,rect_size)
		if bounds.has_point(event.position):
			get_tree().change_scene("res://Scenes/UI/Control/Control_Room.tscn")
