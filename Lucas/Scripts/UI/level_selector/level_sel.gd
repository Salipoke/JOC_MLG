extends Label
var lvl = []
var boss_lvl = []
var lvl_i = ''
var boss_timer = 0
var x = -1
var check_timer = false
var level_selected_animation = true
var sprite = ''
var index = 0
var boss_mode = false



func _ready():
	if Global.boss_lvl_check == 2:
		get_tree().quit()
func _input(event:InputEvent):
	if event is InputEventKey and event.is_action_pressed("ui_home"):
		if Global.level_counter_for_boss == 5 or Global.level_counter_for_boss == 10 or Global.level_counter_for_boss == 15:
			Global.boss_lvl_check += 1
#			print (Global.boss_lvl[Global.boss_lvl_check])
			if boss_mode == true:
				get_tree().change_scene(Global.boss_lvl[Global.boss_lvl_check])
				Global.level_counter_for_boss += 1
		if boss_mode == false:
			Global.level_counter_for_boss += 1
			print(Global.level_counter_for_boss)
			get_tree().change_scene(Global.lvl[x])
	#			print(Global.lvl[x])
			index = Global.lvl_here.find(Global.lvl[x],0)
			Global.lvl.erase(Global.lvl[x])
	#			print(index)
			Global.lvl_here.erase(Global.lvl_here[index])
	#			print(Global.img_lvl)
			print(len(Global.lvl_here))
			Global.img_lvl.erase(Global.img_lvl[index])

func _on_Timer_timeout():
	if check_timer == false:
		check_timer = true
	else:
		if Global.level_counter_for_boss == 5 or Global.level_counter_for_boss == 10 or Global.level_counter_for_boss == 15:
			Global.boss_lvl_check += 1
			print (Global.boss_lvl[Global.boss_lvl_check])
			if boss_mode == true:
				get_tree().change_scene(Global.boss_lvl[Global.boss_lvl_check])
				Global.level_counter_for_boss += 1
		if boss_mode == false:
			Global.level_counter_for_boss += 1
			print(Global.level_counter_for_boss)
			get_tree().change_scene(Global.lvl[x])
	#			print(Global.lvl[x])
			index = Global.lvl_here.find(Global.lvl[x],0)
			Global.lvl.erase(Global.lvl[x])
	#			print(index)
			Global.lvl_here.erase(Global.lvl_here[index])
	#			print(Global.img_lvl)
			print(len(Global.lvl_here))
			Global.img_lvl.erase(Global.img_lvl[index])

func _on_Timer2_timeout():
	if Global.level_counter_for_boss == 5 or Global.level_counter_for_boss == 15 or Global.level_counter_for_boss == 10:
		if boss_timer == 0:
			$ColorRect.raise()
			$ColorRect.visible = true
		boss_timer += 1
		print(Global.boss_lvl_check)
		if Global.boss_lvl_check == -1:
			$'Boss01'.visible = true
			$'Boss01'.raise()
		if Global.boss_lvl_check == 0:
			$'Boss02'.visible = true
			$'Boss02'.raise()
		if Global.boss_lvl_check == 1:
			$'Boss03'.visible = true
			$'Boss03'.raise()
		boss_mode = true
	elif check_timer == false and boss_mode == false:
		if x == len(Global.lvl)-1:
			x = 0
		x += 1
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/01/nivell_1_main.tscn' and '01' in Global.img_lvl:
			$'01'.raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/02/nivell_2_main.tscn' and '02' in Global.img_lvl:
			$'02'.raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/03/nivell_3_main.tscn' and '03' in Global.img_lvl:
			$'03'.raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/04/nivell_4_main.tscn' and '04' in Global.img_lvl:
			$'04'.raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/05/nivell_5_main.tscn' and '05' in Global.img_lvl:
			$'05'.raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/06/nivell_6_main.tscn' and '06' in Global.img_lvl:
			$'06'.raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/07/nivell_7_main.tscn' and '07' in Global.img_lvl:
			$'07'.raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/08/nivell_8_main.tscn' and '08' in Global.img_lvl:
			$"08".raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/09/nivell_9_main.tscn' and '09' in Global.img_lvl:
			$"09".raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/10/nivell_10_main.tscn' and '10' in Global.img_lvl:
			$'10'.raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/11/nivell_11_main.tscn' and '11' in Global.img_lvl:
			$"11".raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/12/nivell_12_main.tscn' and '12' in Global.img_lvl:
			$'12'.raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/13/nivell_13_main.tscn' and '13' in Global.img_lvl:
			$'13'.raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/14/nivell_14_main.tscn' and '14' in Global.img_lvl:
			$'14'.raise()
		if Global.lvl[x] == 'res://Lucas/Scenes/Nivells/15/nivell_15_main.tscn' and '15' in Global.img_lvl:
			$'15'.raise()
	else:
		if level_selected_animation == true:
			rect_scale += Vector2(0.1,0.1)
			level_selected_animation = false
		else:
			level_selected_animation = true
