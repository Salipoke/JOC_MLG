extends Label

func _input(event:InputEvent):
	if event is InputEventMouseButton and event.pressed:
		var bounds = Rect2(rect_position,rect_size)
		if bounds.has_point(event.position):
			var m_position = (event.position[0]-rect_position[0])
			m_position = (stepify(m_position,Engine.get_frames_per_second()))
			if m_position == 0:
				m_position = 10
			text = ('           FPS:'+str(m_position))
			Engine.set_target_fps(m_position)
