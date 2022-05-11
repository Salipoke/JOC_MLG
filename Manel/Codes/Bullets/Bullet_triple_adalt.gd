extends KinematicBody2D

var move = Vector2.ZERO
var look_player = Vector2.ZERO
var player = null
var vel = 3

func _ready():
	look_player = player.position - global_position

func _physics_process(delta):
	move = Vector2.ZERO
	
	move = move.move_toward(look_player, delta)
	move = move.normalized() * vel
	position.y += -cos(move.y)
	position.x += move.x

func _on_Visibility_R_screen_exited():
	queue_free()
