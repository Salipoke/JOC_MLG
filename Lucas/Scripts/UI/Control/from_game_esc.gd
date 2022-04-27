extends Control
#DESDE EL JOC, SI PREMS ESC, VA AL MENU

func _input(InputEvent):
	if Input.is_action_just_pressed("ui_home"):
		get_tree().change_scene("res://Lucas/Scenes/UI/labels/menu.tscn")
