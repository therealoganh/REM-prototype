extends Area2D


func _on_timer_timeout() -> void:
	pass # Replace with function body.
	
	



@export var object_scene: PackedScene = preload("res://Hazard.tscn")


var spawn_area: Rect2


func _ready():
	
	var collision_shape = get_node("CollisionShape2D")
	if collision_shape:
		spawn_area = collision_shape.shape.get_rect()
	
	


func _on_Timer_timeout():
	if object_scene:
		spawn_object()

func spawn_object():
	
	var new_object = object_scene.instantiate()
	
	# Generate a random position within the defined area.
	var random_pos_x = randf_range(spawn_area.position.x, spawn_area.end.x)
	var random_pos_y = randf_range(spawn_area.position.y, spawn_area.end.y)
	
	# The global position needs to account for the Area2D's own position.
	var spawn_position = global_position + Vector2(random_pos_x, random_pos_y)
	new_object.global_position = spawn_position
	
	# Add the new object to the scene tree.
	# We add it as a child of the current node (the Area2D).
	get_parent().add_child(new_object)
