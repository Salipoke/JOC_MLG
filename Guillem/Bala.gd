extends Area2D

var dir : Vector2

func fire(origin : Vector2, dest : Vector2):
	dir = origin.direction_to(dest)
	global_position = origin

func _process(delta):
	if dir:
		global_position += dir * delta * 350


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
