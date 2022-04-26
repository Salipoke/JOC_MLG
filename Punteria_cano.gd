extends KinematicBody2D

var dest_bullet_rec = preload("res://Bala.tscn")
export (float) var rotation_speed = 3

var rotation_dir = 0

func Movement_cannon(delta):
	rotation_dir = 0
	if Input.is_action_pressed("Dreta"):
		rotation_dir += 1
	if Input.is_action_pressed("Esquerra"):
		rotation_dir -= 1
	rotation += rotation_dir * rotation_speed * delta

func _input(event):
	if event.is_action_pressed("shoot"):
		var dest_bullet_inst = dest_bullet_rec.instance()
		dest_bullet_inst.fire($Balazo.global_position, get_global_mouse_position())
		dest_bullet_inst.global_position = $Balazo.global_position
		add_child(dest_bullet_inst)
