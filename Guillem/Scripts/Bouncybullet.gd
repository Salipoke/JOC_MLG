extends RigidBody2D

export var max_bounce = 1

func rebote():
	if max_bounce <= 0:
		queue_free()
	max_bounce -= 1
