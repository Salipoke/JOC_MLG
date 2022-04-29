export var velocitat := 300
var direccio = Vector2(0, 0)
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = 90
	position = Vector2(500, 300)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direccio = Vector2(0,0)
	
	if Input.is_action_pressed("right"):
		direccio.x = 1
		rotation_degrees += 1
	if Input.is_action_pressed("left"):
		direccio.x = -1
		rotation_degrees -= 1
	if Input.is_action_pressed("up"):
		direccio.y = -1
	if Input.is_action_pressed("down"):
		direccio.y = 1

	position += direccio * velocitat * delta
