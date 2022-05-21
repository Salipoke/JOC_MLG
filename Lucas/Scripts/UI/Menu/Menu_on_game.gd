extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()


func _on_StartButton_pressed():
	get_tree().change_scene('res://Lucas/Scenes/Nivells/level_selector/level_sel_screen.tscn') 
	print('start')


func _on_OptionButton_pressed():
	get_tree().change_scene("res://Lucas/Scenes/UI/Control/options.tscn")

func _on_ExitButton_pressed():
	get_tree().change_scene("res://start.tscn")
