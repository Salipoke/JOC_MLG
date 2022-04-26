extends KinematicBody2D

var velocitat_base = 300
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980 #Si cada 100 pixels es un metre
var salt = Vector2.UP * 500
var doble_salt = 1

func _physics_process(delta):
	velocitat.x = 0
	if Input.is_action_pressed("right"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("left"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("up") and doble_salt != 0:
		velocitat += Vector2.UP * velocitat_base
	if Input.is_action_pressed("return"):
		position = Vector2(503,199)
		
	velocitat = move_and_slide(velocitat, Vector2.UP)
