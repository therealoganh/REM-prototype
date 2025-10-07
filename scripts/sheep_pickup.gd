extends Area2D

@export var speed: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y = speed * delta
	
	# Clean up when off screen
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()
	

func _on_body_entered(body: Node2D) -> void:
	queue_free()
