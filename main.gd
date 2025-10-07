extends Node2D

@export var hazard_scene: PackedScene
@export var spawn_interval: float = 1.0
@export var hazard_min_speed: float = 150.0
@export var hazard_max_speed: float = 300.0

var rng := RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	$SpawnTimer.wait_time = spawn_interval
	$SpawnTimer.one_shot = false
	$SpawnTimer.autostart = true  # make sure it starts automatically
	$SpawnTimer.start()
	
	if not $SpawnTimer.is_connected("timeout", Callable(self, "_on_SpawnTimer_timeout")):
		$SpawnTimer.timeout.connect(_on_SpawnTimer_timeout)

func _on_SpawnTimer_timeout() -> void:
	spawn_hazard()

func spawn_hazard() -> void:
	if hazard_scene == null:
		print("Hazard scene not assigned!")
		return

	var hazard = hazard_scene.instantiate()
	
	# Set random X *before* adding to scene
	var screen_size = get_viewport_rect().size
	var x_position = rng.randf_range(0.0, screen_size.x)
	hazard.position = Vector2(x_position, -50)  # Spawn just above screen

	# Randomize speed
	var speed = rng.randf_range(hazard_min_speed, hazard_max_speed)
	if "fall_speed" in hazard:
		hazard.fall_speed = speed
	else:
		hazard.set("fall_speed", speed)

	add_child(hazard)


func _on_spawn_timer_timeout() -> void:
	pass # Replace with function body.
