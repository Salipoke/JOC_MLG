extends Label
func _ready():
	if Global.FPS != $HScrollBar.value:
		$HScrollBar.value = Global.FPS
	text = Global.FPS_text
func _on_HScrollBar_scrolling():
	var value_fps = int($HScrollBar.value)
	if value_fps == 0:
		Global.FPS = $HScrollBar.value
		Engine.set_target_fps(0)
		OS.set_use_vsync(true)
		text = ('           Vsync')
		Global.FPS_text = text
	else:
		OS.set_use_vsync(false)
		text = ('           FPS:'+str(value_fps))
		Global.FPS_text = text
		Global.FPS = $HScrollBar.value
		Engine.set_target_fps(value_fps)
