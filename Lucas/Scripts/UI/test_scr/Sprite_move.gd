extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var vel = 100


func _process(delta):
	rect_position.x += vel*delta
	if rect_position.x >= 924 or rect_position.x <= 100:
		vel = -vel
