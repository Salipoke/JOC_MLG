extends KinematicBody2D

var dest_bullet_rec = preload("res://Bala.tscn")
export (int) var speed = 200
export (float) var rotation_speed = 3

var velocity = Vector2()
var rotation_dir = 0

func Movement(delta):
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("Dreta"):
		rotation_dir += 1
	if Input.is_action_pressed("Esquerra"):
		rotation_dir -= 1
	if Input.is_action_pressed("Baixa"):
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("Puja"):
		velocity = Vector2(speed, 0).rotated(rotation)
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)

func _physics_process(delta):
	Movement(delta)
	look_at_mouse()

func look_at_mouse():
	var mouse_pos = get_global_mouse_position()
	get_node("Apuntado").look_at(mouse_pos)

func _input(event):
	if event.is_action_pressed("shoot"):
		var dest_bullet_inst = dest_bullet_rec.instance()
		dest_bullet_inst.fire($Balazo.global_position, get_global_mouse_position())
		dest_bullet_inst.global_position = $Balazo.global_position
		add_child(dest_bullet_inst)
