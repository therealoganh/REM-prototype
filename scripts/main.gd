extends Node2D

@export var sheep_scene: PackedScene

func _ready():
	# Configure the timer
	$SheepSpawnTimer.wait_time = 2.0 # Spawn rate
	$SheepSpawnTimer.autostart = true
	$SheepSpawnTimer.one_shot = false
	
	# Connect signal
	$SheepSpawnTimer.timeout.connect(spawn_sheep)
	
func spawn_sheep():
	if sheep_scene == null:
		push_error("Sheep secene not assigned")
		return
	
	var sheep = sheep_scene.instantiate()
	var screen_width = get_viewport_rect().size.x
	
	sheep.position = Vector2(randf_range(0, screen_width), -50) # Random x value, above viewport
	add_child(sheep)
	
	print("Spawned sheep at:", sheep.position)
