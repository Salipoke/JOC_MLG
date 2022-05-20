extends Sprite




# Called when the node enters the scene tree for the first time.
func _ready():
	position[0] = 780

func _input(event:InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.position[0] > 720 and event.position[0] < (721+170):
			position[0] = event.position[0]
