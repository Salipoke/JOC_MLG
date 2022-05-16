extends Node
var level_counter_for_boss = 0
var boss_lvl_check = -1
func _input(event:InputEvent):
	if event is InputEventKey and event.is_action_pressed("ui_home"):
		if get_tree().get_current_scene().get_name() == 'options':
			get_tree().change_scene("res://start.tscn")

func _ready():
	if get_tree().get_current_scene().get_name() == 'level_sel':
		level_counter_for_boss += 1
		if level_counter_for_boss == 5 or 10 or 15:
			print('pog')
