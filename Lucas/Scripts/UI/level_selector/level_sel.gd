extends Label
var lvl = []
var boss_lvl = []
var lvl_i = ''
var actual_string = 0
func _ready():
	for i in range(16):
		if i > 9:
			lvl_i = ('Lucas/Scenes/Nivells/nivell_{i}_main.tscn')
			actual_string = lvl_i.format({"i": i})
		else:
			lvl_i = ('Lucas/Scenes/Nivells/nivell_0{i}_main.tscn')
			actual_string = lvl_i.format({"i": i})
		lvl.append(actual_string)
	for i in range(4):
		var lvl_i_boss = ('Lucas/Scenes/boss_{i}/nivell_boss_{i}_main.tscn')
		var actual_string = lvl_i_boss.format({"i": i})
		boss_lvl.append(actual_string)
	print (lvl,boss_lvl)
