extends KinematicBody2D

onready var BULLET_SCENE = preload("res://Manel/Scenes/Bullets/Bullet_3bales.tscn")

var health = 300
var vel = 1.5
var move = Vector2.ZERO
var player = null
var nbullets = 0

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
		$Sprite.look_at(player.global_position)
		
	move = move_and_collide(move)

func _on_Area2D_body_entered(body):
	if body.name == "Movimiento":
		player = body

func fire():
	if nbullets <= 2:
		var bullet = BULLET_SCENE.instance()
		bullet.position = get_global_position()
		bullet.player = player
		get_parent().add_child(bullet)
		$Timer.set_wait_time(0.5)
		nbullets += 1
	else:
		nbullets = 0
	

func _on_Timer_timeout():
	if player != null:
		$AudioStreamPlayer.play() 
		fire()
