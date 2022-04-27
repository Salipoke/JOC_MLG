extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var vel = 100


func _process(delta):
	position.x += vel*delta
	if position.x >= 1000 or position.x <= 200:
		vel = -vel
