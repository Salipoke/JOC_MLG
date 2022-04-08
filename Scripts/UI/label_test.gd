extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event:InputEvent):
	if event is InputEventMouseButton and event.pressed:
		var bounds = Rect2(rect_position,rect_size)
		if bounds.has_point(event.position):
			print ('a')
	if InputEventKey('ui_home'):
		get_tree().change_scene("res://Scenes/label_test.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
