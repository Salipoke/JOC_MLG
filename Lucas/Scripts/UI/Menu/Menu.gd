extends Control


func _ready():
	$VBoxContainer/StartButton.grab_focus()


func _on_StartButton_pressed():
	get_tree().change_scene('res://Lucas/Scenes/Nivells/level_selector/level_sel_screen.tscn')
	Global.last_scene_midgame = true


func _on_OptionButton_pressed():
	get_tree().change_scene("res://Lucas/Scenes/UI/Control/options.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()
