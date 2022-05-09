extends Node
#DESDE LA PESTANYA D'OPCIONS, SI PREMS ESC, VA AL MENU

func _input(event:InputEvent):
	if event is InputEventKey and event.is_action_pressed("ui_home"):
			get_tree().change_scene("res://start.tscn")
