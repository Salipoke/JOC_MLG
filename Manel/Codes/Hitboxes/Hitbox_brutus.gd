extends Area2D

var health = null
var shield = false

func _process(delta):
	if shield == false:
		get_parent().get_node("Animacio").play("Normal")
		for i in get_overlapping_areas():
			if i.is_in_group("bullets_player"):
				health = true
				i.queue_free()
	else:
		get_parent().get_node("Animacio").play("Shield")

func _on_Shield_timeout():
	shield = true
	$Shieldnt.start()

func _on_Shieldnt_timeout():
	shield = false
	$Shield.set_wait_time(12)
	$Shield.start()
