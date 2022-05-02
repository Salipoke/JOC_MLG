extends KinematicBody2D

export var velocitat := 300
var direccio = Vector2(0, 0)

func _process(delta):
	direccio = Vector2(0,0)
	
	if Input.is_action_pressed("right"):
		direccio.x = 1
		rotation_degrees += 1
	if Input.is_action_pressed("left"):
		direccio.x = -1
		rotation_degrees -= 1
	if Input.is_action_pressed("up"):
		direccio.y = -1
	if Input.is_action_pressed("down"):
		direccio.y = 1

	position += direccio * velocitat * delta
