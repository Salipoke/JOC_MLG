extends Label
var lvl = []
var boss_lvl = []
var lvl_i = ''
var actual_string = 0
var x = -1
var check_timer = false
var level_selected_animation = true
func _ready():
	if len(Global.lvl) <= 2:
		get_tree().quit()
func _input(event:InputEvent):
	if event is InputEventKey and event.is_action_pressed("ui_home"):
		if Global.level_counter_for_boss == 5 or Global.level_counter_for_boss == 10 or Global.level_counter_for_boss == 15:
			Global.boss_lvl_check += 1
			Global.level_counter_for_boss += 1
			print(Global.boss_lvl_check)
			print (Global.boss_lvl[Global.boss_lvl_check])
			get_tree().change_scene(Global.boss_lvl[Global.boss_lvl_check])
		else:
			Global.level_counter_for_boss += 1
	#		print(Global.level_counter_for_boss)
			Global.lvl.erase(Global.lvl[0])
			get_tree().change_scene(Global.lvl[0])

func _on_Timer_timeout():
	if check_timer == false:
		check_timer = true
	else:
		if Global.level_counter_for_boss == 5 or Global.level_counter_for_boss == 10 or Global.level_counter_for_boss == 15:
			print (Global.boss_lvl[Global.boss_lvl_check])
			Global.boss_lvl_check += 1
			get_tree().change_scene(Global.boss_lvl[Global.boss_lvl_check])
		else:
			Global.level_counter_for_boss += 1
			print(Global.level_counter_for_boss)
			Global.lvl.erase(Global.lvl[0])
			get_tree().change_scene(Global.lvl[0])

func _on_Timer2_timeout():
	if check_timer == false:
		if x == len(Global.lvl):
			x = 0
		text = Global.lvl[x]
		x += 1
	else:
		if level_selected_animation == true:
			text = Global.lvl[x]
			level_selected_animation = false
		else:
			text = ''
			level_selected_animation = true
