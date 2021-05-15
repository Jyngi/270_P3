extends Node2D

func _input(event):
	if Input.is_action_just_pressed("ui_select") == true:
		get_tree().change_scene("res://Scene/gameplay.tscn")

