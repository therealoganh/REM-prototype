extends Node2D
var enter = Input.is_action_just_pressed("move_down")

func _process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		print("Restarting game...")
		
		get_tree().change_scene_to_file("res://scenes/main.tscn")
