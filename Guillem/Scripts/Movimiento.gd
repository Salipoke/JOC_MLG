extends KinematicBody2D

var dest_bullet_rec = preload("res://Guillem/Scenes/Bala.tscn")

onready var fireDelayTimer := $FireDelayTimer

export (int) var speed = 200
export (float) var rotation_speed = 3
export var fireDelay: float = 0.8
export var angle_dispersio = 10
export var mode = 0

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
	$Apuntado.look_at(mouse_pos)

func _input(event):
	if mode == 0:
		if Input.is_action_pressed("shoot") and fireDelayTimer.is_stopped():
			fireDelayTimer.start(fireDelay)
			var dest_bullet_inst = dest_bullet_rec.instance()
			dest_bullet_inst.fire($Apuntado/Balazo.global_position, get_global_mouse_position())
			dest_bullet_inst.global_position = $Apuntado/Balazo.global_position
			Global.Bales.add_child(dest_bullet_inst)
	if mode == 1:
		if Input.is_action_pressed("shoot") and fireDelayTimer.is_stopped():
			fireDelayTimer.start(fireDelay)
			for i in range(3):
				var dest_bullet_inst = dest_bullet_rec.instance()
				dest_bullet_inst.fire($Apuntado/Multiple.global_position, get_global_mouse_position())
				dest_bullet_inst.dir = dest_bullet_inst.dir.rotated(i * deg2rad(angle_dispersio) - deg2rad(angle_dispersio))
				dest_bullet_inst.global_position = $Apuntado/Multiple.global_position
				Global.Bales.add_child(dest_bullet_inst)



func _on_Area2D_body_entered(body):
	pass # Replace with function body.
