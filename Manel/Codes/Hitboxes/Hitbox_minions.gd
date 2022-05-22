extends Area2D

var health = null
var minions_morts = null

func _process(delta):
	if minions_morts == true:
		for i in get_overlapping_areas():
			if i.is_in_group("bullets_player"):
				health = true
				i.queue_free()
	else:
		for i in get_overlapping_areas():
			if i.is_in_group("bullets_player"):
				i.queue_free()
