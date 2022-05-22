extends Area2D

var move = Vector2.ZERO
var look_player = Vector2.ZERO
var player = null
var vel = 3
var damage = 250

func _ready():
	look_player = player.position - global_position

func _physics_process(delta):
	move = Vector2.ZERO
	
	move = move.move_toward(look_player, delta)
	move = move.normalized() * vel
	position += move

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
