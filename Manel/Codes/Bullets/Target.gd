extends Sprite

var timer = true

func _process(delta):
	if timer == true:
		scale -= Vector2(0.1,0.1) * delta
