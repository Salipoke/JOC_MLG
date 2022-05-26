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
var lvl_here = ['res://Lucas/Scenes/Nivells/01/nivell_1_main.tscn', 'res://Lucas/Scenes/Nivells/02/nivell_2_main.tscn', 'res://Lucas/Scenes/Nivells/03/nivell_3_main.tscn', 'res://Lucas/Scenes/Nivells/04/nivell_4_main.tscn', 'res://Lucas/Scenes/Nivells/05/nivell_5_main.tscn', 'res://Lucas/Scenes/Nivells/06/nivell_6_main.tscn', 'res://Lucas/Scenes/Nivells/07/nivell_7_main.tscn', 'res://Lucas/Scenes/Nivells/08/nivell_8_main.tscn', 'res://Lucas/Scenes/Nivells/09/nivell_9_main.tscn', 'res://Lucas/Scenes/Nivells/10/nivell_10_main.tscn', 'res://Lucas/Scenes/Nivells/11/nivell_11_main.tscn', 'res://Lucas/Scenes/Nivells/12/nivell_12_main.tscn', 'res://Lucas/Scenes/Nivells/13/nivell_13_main.tscn', 'res://Lucas/Scenes/Nivells/14/nivell_14_main.tscn', 'res://Lucas/Scenes/Nivells/15/nivell_15_main.tscn']
var img_lvl = ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15']
var mus = true



func _input(event:InputEvent):
	if event is InputEventKey and event.is_action_pressed("ui_home"):
		if get_tree().get_current_scene().get_name() == 'options':
			if last_scene_midgame == true:
				get_tree().change_scene("res://Lucas/Scenes/UI/Control/between_lvl.tscn")
			else:
				get_tree().change_scene('res://start.tscn')




func _ready():
	OS.vsync_enabled = true
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
	print(lvl)
	randomize()
	lvl.shuffle()


