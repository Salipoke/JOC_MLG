extends KinematicBody2D

onready var BULLET_SCENE = preload("res://Manel/Scenes/Bullets/Bullet_Boss 1.tscn")
onready var MINIONS = preload("res://Manel/Scenes/Enemies/Minion.tscn")

var health = 1500
var vel = 4.5
var move = Vector2.ZERO
var player = null
var spawn_minions = 1
var check_m = 4
#Minion1
var minion1 = null
var loop1 = 1
#Minion2
var minion2= null
var loop2 = 1
#Minion3
var minion3 = null
var loop3 = 1
#Minion4
var minion4= null
var loop4 = 1

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
			
		$Animacio.look_at(player.global_position)
			
	move = move_and_collide(move)
	
	#Coses de minions i tal
	if spawn_minions == 1:
		#Minion 1
		minion1 = MINIONS.instance()
		minion1.position = $Spawn1.get_global_position()
		get_parent().add_child(minion1)
		#Minion 2
		minion2 = MINIONS.instance()
		minion2.position = $Spawn2.get_global_position()
		get_parent().add_child(minion2)
		#Minion 3
		minion3 = MINIONS.instance()
		minion3.position = $Spawn3.get_global_position()
		get_parent().add_child(minion3)
		#Minion 4
		minion4 = MINIONS.instance()
		minion4.position = $Spawn4.get_global_position()
		get_parent().add_child(minion4)
		
		spawn_minions = 0
	else:
		#Minion1
		if loop1 == 1 and minion1.mort == true:
			check_m -= 1
			minion1.queue_free()
			loop1 = 0
		#Minion2
		if loop2 == 1 and minion2.mort == true:
			check_m -= 1
			minion2.queue_free()
			loop2= 0
		#Minion3
		if loop3 == 1 and minion3.mort == true:
			check_m -= 1
			minion3.queue_free()
			loop3 = 0
		#Minion4
		if loop4 == 1 and minion4.mort == true:
			check_m -= 1
			minion4.queue_free()
			loop4= 0
		#Escut
		if check_m == 0:
			$Animacio.play('Normal')
			$Hitbox.minions_morts = true

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
		$AudioStreamPlayer.play()
		fire()
