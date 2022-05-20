extends Sprite

var timer = false

func _process(delta):
	if timer == true:
		scale -= Vector2(0.1,0.1) * delta
