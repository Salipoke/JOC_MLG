extends Label

func _on_HScrollBar_scrolling():
	var value_fps = int($HScrollBar.value)
	value_fps = (stepify(value_fps,10))
	if value_fps == 0:
		Engine.set_target_fps(0)
		OS.set_use_vsync(true)
		text = ('           Vsync')
	else:
		OS.set_use_vsync(false)
		text = ('           FPS:'+str(value_fps))
		Engine.set_target_fps(value_fps)
