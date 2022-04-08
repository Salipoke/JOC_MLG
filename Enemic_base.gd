extends KinematicBody2D

var health = 500
var vel_base = 300
var vel = Vector2.ZERO
var damage = 50
var p_position = 0 #player position

func _physics_process(delta):
	#Health
	if 1 == 1: #posar un if q funcioni quan la area de la bala del jugador doni al enemic
		health -= 100
	if health <= 0:
		pass
	
	#Velocity & Position
	if 1 == 1: #la dada q tingui q sortir prq es mogui esquerra
		vel = Vector2.LEFT * vel_base
	elif 1 == 2:#dada dreta
		vel = Vector2.RIGHT * vel_base
	elif 1 == 3: #dada adalt
		vel = Vector2.UP * vel_base
	elif 1 == 2:#dada abaix
		vel = Vector2.DOWN * vel_base
	else:
		vel = Vector2.ZERO
	
	vel = move_and_slide(vel, Vector2.UP)
	
	#Code
	#var p_position = get_tree()
