extends Node2D
func _process(delta):
	
	
	
	if Input.is_action_just_pressed("ui_accept"):
		print("Restarting game...")
		
		get_tree().change_scene_to_file("res://scenes/main.tscn")
