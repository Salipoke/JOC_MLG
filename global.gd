extends Node

func _input(event:InputEvent):
	if event is InputEventKey and event.is_action_pressed("ui_home"):
		get_tree().change_scene("res://start.tscn")


func _ready():
	pass # Replace with function body.

