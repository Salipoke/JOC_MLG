extends KinematicBody2D

onready var BULLET_SCENE = preload("res://Manel/Scenes/Bullets/Bullet_base.tscn")

var health = 500
var vel = 1.5
var move = Vector2.ZERO
var damage = 50
var player = null

func _physics_process(delta):
	#Health
	if 1 == 1: #posar un if q funcioni quan la area de la bala del jugador doni al enemic
		health -= 100
	if health <= 0:
		pass
	
	#Velocity & Position
	move = Vector2.ZERO
	
	if player != null:
		var to_player = player.global_position - self.global_position
		var distance = to_player.length()
		if distance < 296:
			move = position.direction_to(player.position) * (-vel)
		elif distance < 300:
			pass
		else:
			move = position.direction_to(player.position) * vel
		
	move = move_and_collide(move)
#https://www.youtube.com/watch?v=O0rdD104Qsg

func _on_Area2D_body_entered(body):
	if body.name == "jugateur": #quan s'agunti tot es té que canviar al nom del jugador
		player = body

func fire():#https://godotengine.org/qa/81726/how-to-make-enemy-shoot-at-player
	var bullet = BULLET_SCENE.instance()
	bullet.position = get_global_position()
	bullet.player = player
	get_parent().add_child(bullet)
	$Timer.set_wait_time(1)

func _on_Timer_timeout():
	if player != null:
		fire()
