extends KinematicBody2D

onready var BULLET_SCENE = preload("res://Manel/Scenes/Bullets/Bullet_Bombardero.tscn")
onready var TARGET = preload("res://Manel/Scenes/Bullets/Target.tscn")

var health = 500
var damage = 50
var player = null
var p_bullet = Vector2(0,0)
var target = null

func _physics_process(delta):
	#Health
	if 1 == 1: #posar un if q funcioni quan la area de la bala del jugador doni al enemic
		health -= 100
	if health <= 0:
		pass

func _on_Area2D_body_entered(body):
	if body.name == "jugateur": #quan s'agunti tot es té que canviar al nom del jugador
		player = body

func fire():
	target = TARGET.instance()
	target.position = player.position
	p_bullet = target.position
	get_parent().add_child(target)
	
	$Target.set_wait_time(3)
	$Target.start()
	$Timer.set_wait_time(5)

func foc():
	var bullet = BULLET_SCENE.instance()
	bullet.position = get_global_position()
	bullet.player = p_bullet
	get_parent().add_child(bullet)
	
func _on_Timer_timeout():
	if player != null:
		fire()

func _on_Target_timeout():
	foc()
	
