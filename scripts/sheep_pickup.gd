extends Area2D

@export var fall_speed: float = 50.0
var array = []
var drift_speed = 20.0
var time = 0.0



func _process(delta):
	time += delta
	position.y += fall_speed * delta
	position.x += sin(time * 2.0) * drift_speed * delta

	# remove when offscreen
	var screen_height = get_viewport_rect().size.y
	if position.y > screen_height + 50:
		queue_free()
		



func _on_body_entered(body: Node2D, count: int = 0) -> void:
	
	if body.name == "Player":
		
		
		
		
		NewScript.score += 1 # Increment the global score by 1
		print("Current Score: ", NewScript.score)
		if NewScript.score == 2:
			get_tree().change_scene_to_file("res://scenes/Start screen.tscn ")

		queue_free()

	
	
