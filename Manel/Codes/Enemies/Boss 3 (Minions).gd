extends KinematicBody2D

onready var BULLET_SCENE = preload("res://Manel/Scenes/Bullets/Bullet_Boss 1.tscn")
onready var MINIONS = preload("res://Manel/Scenes/Enemies/Minion.tscn")

var health = 1500
var vel = 4.5
var move = Vector2.ZERO
var player = null
var spawn_minions = 1

func _physics_process(delta):
	#Health
	if $Hitbox.health == true:
		health -= 100
		$Hitbox.health = false
	if health <= 0:
		queue_free()
	
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
	
	#Minions
	if spawn_minions == 1:
		var minion1 = MINIONS.instance()
		minion1.position = get_global_position().x +90
		#get_parent().add_child(minion1)
		
		spawn_minions = 0

func _on_Area2D_body_entered(body):
	if body.name == "Movimiento":
		player = body

func fire():
	var bullet = BULLET_SCENE.instance()
	bullet.position = get_global_position()
	bullet.player = player
	get_parent().add_child(bullet)
	$Timer.set_wait_time(1)

func _on_Timer_timeout():
	if player != null:
		fire()
