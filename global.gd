extends Node


var Bales
var level_counter_for_boss = 0
var boss_lvl_check = -1
var lvl = []
var boss_lvl = []
var actual_string = ''
var lvl_i = ''
var FPS = 0
var FPS_text = '           Vsync'
var fullscreen = 'FULLSCREEN : OFF'
var last_scene_midgame = false



func _input(event:InputEvent):
	if event is InputEventKey and event.is_action_pressed("ui_home"):
		if get_tree().get_current_scene().get_name() == 'options':
			if last_scene_midgame == true:
				get_tree().change_scene("res://Lucas/Scenes/UI/Control/between_lvl.tscn")
			else:
				get_tree().change_scene('res://start.tscn')




func _ready():
	for i in range(1,16):
		if i > 9:
			lvl_i = ('res://Lucas/Scenes/Nivells/{i}/nivell_{i}_main.tscn')
			actual_string = lvl_i.format({"i": i})
		else:
			lvl_i = ('res://Lucas/Scenes/Nivells/0{i}/nivell_{i}_main.tscn')
			actual_string = lvl_i.format({"i": i})
		lvl.append(actual_string)
	for i in range(1,4):
		var lvl_i_boss = ('res://Lucas/Scenes/Nivells/boss_{i}/nivell_boss_{i}_main.tscn')
		var actual_string = lvl_i_boss.format({"i": i})
		boss_lvl.append(actual_string)
	randomize()
	lvl.shuffle()


