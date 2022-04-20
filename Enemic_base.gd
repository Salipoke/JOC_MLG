extends KinematicBody2D

var health = 500
var vel_base = 300
var vel = Vector2.ZERO
var damage = 50
const SPEED = 100
var target = null

func _physics_process(delta):
	#Health
	if 1 == 1: #posar un if q funcioni quan la area de la bala del jugador doni al enemic
		health -= 100
	if health <= 0:
		pass
	
	#Velocity & Position
	var velocity = global_position.direction_to(target.global_position)
	move_and_collide(velocity * SPEED * delta)


func _on_Area2D_body_entered(body):
	if body.name == "charaborrar":
		target = body
