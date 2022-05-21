extends Sprite

var timer = true

func _process(delta):
	if timer == true:
		scale -= Vector2(0.3,0.3) * delta
	if scale <= Vector2(0.1,0.1):
		queue_free()
