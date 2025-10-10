extends Node2D
@onready var label = $Label
@onready var newscore = str(NewScript.score)
@export var sheep_scene: PackedScene
@export var hazard_scene: PackedScene
@export var sheep_spawn_interval: float = 3.0
@export var hazard_spawn_interval: float = 2
@export var hazard_min_speed: float = 150.0
@export var hazard_max_speed: float = 300.0
var sheep_timer: float = 0.0
var hazard_timer: float = 0.0

func _ready() -> void:
	
	# Sheep check
	if sheep_scene == null:
		print("ERROR: No sheep scene assigned!")
	elif hazard_scene == null:
		print("ERROR: No hazard scene assigned!")
	else:
		print("Sheep spawner ready – will spawn sheep every", sheep_spawn_interval, "seconds")
		print("Hazard spawner ready – will spawn hazard every", hazard_spawn_interval, "seconds")

func _process(delta):
	
	
	# Sheep & Hazard timer logic
	sheep_timer -= delta
	if sheep_timer <= 0:
		spawn_sheep()
		sheep_timer = sheep_spawn_interval
		
	hazard_timer -= delta
	if hazard_timer <= 0:
		spawn_hazard()
		hazard_timer = hazard_spawn_interval

func spawn_sheep():

	var sheep = sheep_scene.instantiate()
	
	sheep.z_index = 8
	var screen_size = get_viewport_rect().size
	sheep.position = Vector2(randf_range(0, screen_size.x), -50)
	
	add_child(sheep)
	print("Spawned sheep at:", sheep.position)
	
func spawn_hazard():
	var hazard = hazard_scene.instantiate()
	
	hazard.z_index = 9
	var screen_size = get_viewport_rect().size
	hazard.position = Vector2(randf_range(0, screen_size.x), -50)
	
	add_child(hazard)
	print("Spawned hazard at:", hazard.position)
