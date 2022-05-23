extends Node

func _input(event:InputEvent):
	if event is InputEventKey and event.is_action_pressed("ui_home"):
		get_tree().change_scene('res://Lucas/Scenes/UI/Control/between_lvl.tscn')

func _process(delta):
	if get_tree().get_nodes_in_group("enemie").size() == 0:
		print('a')
