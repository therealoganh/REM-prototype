extends Area2D

@export var fall_speed : float = 1.0  # pixels per second

func _process(delta: float) -> void:
	position.y += fall_speed * delta
	
	# remove when offscreen
	var screen_height = get_viewport_rect().size.y
	if position.y > screen_height + 50:
		queue_free()


func _on_body_entered(body):
	print("You died!")
