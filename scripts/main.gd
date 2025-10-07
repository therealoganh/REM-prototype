extends Node2D

@export var sheep_scene: PackedScene
@export var hazard_scene: PackedScene
@export var sheep_spawn_interval: float = 3.0
@export var hazard_spawn_interval: float = 1.0
@export var hazard_min_speed: float = 150.0
@export var hazard_max_speed: float = 300.0
var timer: float = 0.0
var rng := RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	$SpawnTimer.wait_time = hazard_spawn_interval
	$SpawnTimer.one_shot = false
	$SpawnTimer.autostart = true  # make sure it starts automatically
	$SpawnTimer.start()
	
	if not $SpawnTimer.is_connected("timeout", Callable(self, "_on_SpawnTimer_timeout")):
		$SpawnTimer.timeout.connect(_on_spawn_timer_timeout)
	
	# Sheep logic
	if sheep_scene == null:
		print("ERROR: No sheep scene assigned!")
	else:
		print("Spawner ready – will spawn every", sheep_spawn_interval, "seconds")
		
func _on_spawn_timer_timeout() -> void:
	spawn_hazard()
	
func spawn_hazard() -> void:
	if hazard_scene == null:
		print("Hazard scene not assigned!")
		return

	var hazard = hazard_scene.instantiate()
	hazard.z_index = 9
	
	# Set random X *before* adding to scene
	var screen_size = get_viewport_rect().size
	var x_position = rng.randf_range(0.0, screen_size.x)
	hazard.position = Vector2(x_position, -50)  # Spawn just above screen

	add_child(hazard)

func _process(delta):
	
	# timer logic
	timer -= delta
	if timer <= 0:
		spawn_sheep()
		timer = sheep_spawn_interval

func spawn_sheep():

	var sheep = sheep_scene.instantiate()
	
	sheep.z_index = 8
	var screen_size = get_viewport_rect().size
	sheep.position = Vector2(randf_range(0, screen_size.x), -50)
	
	add_child(sheep)
	print("Spawned sheep at:", sheep.position)
