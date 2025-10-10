extends Node2D
func _process(delta):
	# Check if the "move_down" action was JUST pressed this frame.
	if Input.is_action_just_pressed("ui_accept"):
		print("Restarting game...")
		# This is the correct way to change a scene in Godot 4.
		get_tree().change_scene_to_file("res://scenes/main.tscn")
