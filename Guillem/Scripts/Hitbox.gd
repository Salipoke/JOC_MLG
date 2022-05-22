extends Area2D

var health = false
var damage = null

func _process(delta):
	for i in get_overlapping_areas():
		if i.is_in_group("bullet_enemics"):
			health = true
			damage = i.damage
			i.queue_free()
