extends Node

#func _input(event:InputEvent):
#	if event is InputEventKey and event.is_action_pressed("ui_home"):
#		get_tree().change_scene('res://Lucas/Scenes/UI/Control/between_lvl.tscn')

func _process(delta):
	if get_tree().get_nodes_in_group("enemie").empty():
		if get_tree().get_current_scene().get_name() == ('nivell_boss_3_main'):
			get_tree().change_scene('res://Lucas/Scenes/endings/win.tscn')
		else:
			get_tree().change_scene("res://Lucas/Scenes/Nivells/level_selector/level_sel_screen.tscn")
