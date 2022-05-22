extends Area2D

var health = null

func _process(delta):
	for i in get_overlapping_areas():
		if i.is_in_group("bullets_player"):
			health = true
			i.queue_free()
