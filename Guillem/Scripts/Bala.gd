extends Area2D

var dir : Vector2

func fire(origin : Vector2, dest : Vector2):
	dir = origin.direction_to(dest)
	global_position = origin

func _process(delta):
	if dir:
		global_position += dir * delta * 350
	for i in get_overlapping_areas():
		if i.is_in_group("walls"):
			queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
