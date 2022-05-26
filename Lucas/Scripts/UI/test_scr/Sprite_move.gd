extends ColorRect

var vel = 100


func _process(delta):
	rect_position.x += vel*delta
	if rect_position.x >= 924 or rect_position.x <= 100:
		vel = -vel
