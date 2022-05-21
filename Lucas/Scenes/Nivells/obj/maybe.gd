extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if rotation_degrees != 0:
		$Hor.visible = false
		$Ver.visible = true
	else:
		$Ver.visible = false
		$Hor.visible = true

