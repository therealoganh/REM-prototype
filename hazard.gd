extends Area2D

@export var fall_speed : float = 2.0  # pixels per second

func _process(delta: float) -> void:
	position.y += fall_speed * delta
	
	# If it's off bottom of screen, free it
	var viewport_size = get_viewport_rect().size
	if position.y > viewport_size.y + 50:
		queue_free()
