extends Control
var pret = ''
	
func _on_StartButton_pressed():
	$AudioStreamPlayer.play()
	pret = 'start'
	Global.last_scene_midgame = true
	

func _on_OptionButton_pressed():
	$AudioStreamPlayer.play()
	
	pret = 'opt'

func _on_ExitButton_pressed():
	$AudioStreamPlayer.play()
	pret = 'quit'


func _on_AudioStreamPlayer_finished():
	if pret == 'start':
		get_tree().change_scene('res://Lucas/Scenes/Nivells/level_selector/level_sel_screen.tscn')
	if pret == 'opt':
		get_tree().change_scene("res://Lucas/Scenes/UI/Control/options.tscn")
	if pret == 'quit':
		get_tree().quit()


func _on_AudioStreamPlayer2_finished():
	$AudioStreamPlayer2.play()
