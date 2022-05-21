extends Area2D

var move = Vector2.ZERO
var look_player = Vector2.ZERO
var player = null
var vel = 3

func _ready():
	look_player = player - global_position

func _physics_process(delta):
	move = Vector2.ZERO
	
	move = move.move_toward(look_player, delta)
	move = move.normalized() * vel
	position += move
	if player.x < global_position.x:
		if position <= player:
			queue_free()
	elif player > global_position:
		if look_player >= position:
			queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
