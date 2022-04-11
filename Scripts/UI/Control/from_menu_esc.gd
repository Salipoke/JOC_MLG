extends Node
#DESDE EL MENU, SI PREMS ESC, VA AL JOC

func _input(event:InputEvent):
	if event is InputEventKey and event.is_action_pressed("ui_home"):
			get_tree().change_scene("res://Scenes/UI/Control/Control_Room.tscn")
