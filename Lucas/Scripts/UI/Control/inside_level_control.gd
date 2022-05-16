extends Node

func _input(event:InputEvent):
	if event is InputEventKey and event.is_action_pressed("ui_home"):
		get_tree().change_scene('res://Lucas/Scenes/Nivells/level_selector/level_sel_screen.tscn')

func _ready():
	pass
