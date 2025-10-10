extends RigidBody2D

signal hit # Test signal

@export var fall_speed : float = 5.0  # pixels per second
@onready var game_over_timer: Timer = $Hitbox/GameOverTimer

func _ready():
	linear_velocity = Vector2(0, fall_speed) # Let physics move the body

func _physics_process(delta: float) -> void:

	# remove when offscreen
	var screen_height = get_viewport_rect().size.y
	if global_position.y > screen_height + 50:
		queue_free()

func _on_hitbox_body_entered(body: Node2D) -> void:
	print("You died!")
	hit.emit() # Emit signal
	Engine.time_scale = 0.5 # Slow mo on death
	body.hide()
	game_over_timer.start()

func _on_game_over_timer_timeout() -> void:
	Engine.time_scale = 1.0 # Reset time scale
	get_tree().change_scene_to_file("res://scenes/Game over.tscn")
	
