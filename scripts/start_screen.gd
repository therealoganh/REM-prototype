extends Node2D
#var enter = Input.is_action_just_pressed("move_down")
func Start_Game():
	if Input.is_action_pressed("ui_accept"):
		print("Error")
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	#else:
		
