extends Control


func _input(event:InputEvent):
	if event is InputEventKey and event.is_action_pressed("ui_home"):
		get_tree().quit()
