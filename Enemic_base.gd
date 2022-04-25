extends KinematicBody2D

var health = 500
var vel_base = 300
var vel = Vector2.ZERO
var damage = 50
var target = null

func _physics_process(delta):
	#Health
	if 1 == 1: #posar un if q funcioni quan la area de la bala del jugador doni al enemic
		health -= 100
	if health <= 0:
		pass
	
	#Velocity & Position
	vel = position.direction_to(cborrar.position)
#https://www.youtube.com/watch?v=O0rdD104Qsg

func _on_Area2D_body_entered(body):
	if body.name == "cborrar":
		target = body
