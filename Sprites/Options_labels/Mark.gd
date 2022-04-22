extends Sprite




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event:InputEvent):
	if event is InputEventMouseButton and event.pressed:
		var bounds = Rect2(Vector2(714,77),Vector2(178.206))
		if bounds.has_point(event.position[0]-rect_position[0]p)
