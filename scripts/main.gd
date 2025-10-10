extends Node2D

@export var sheep_scene: PackedScene

@export var hazard_scene: PackedScene
@export var clock_scene: PackedScene
@export var phone_scene: PackedScene

@export var sheep_spawn_interval: float = 1
@export var hazard_spawn_interval: float = 1

var sheep_timer: float = 0.0
var hazard_timer: float = 0.0

# for background switching
@onready var backgrounds = $Backgrounds


func _ready() -> void:
	
	Global.score = 0
	
	# Sheep check
	if sheep_scene == null:
		print("ERROR: No sheep scene assigned!")
	elif hazard_scene == null:
		print("ERROR: No hazard scene assigned!")
	else:
		print("Sheep spawner ready – will spawn sheep every", sheep_spawn_interval, "seconds")
		print("Hazard spawner ready – will spawn hazard every", hazard_spawn_interval, "seconds")

func _process(delta):
	
	backgrounds.background_switcher()
	
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
	var hazard1 = clock_scene.instantiate()
	var hazard2 = phone_scene.instantiate()
	
	hazard1.z_index = 9
	hazard2.z_index = 9
	var screen_size = get_viewport_rect().size
	hazard1.position = Vector2(randf_range(0, screen_size.x), -50)
	hazard2.position = Vector2(randf_range(0, screen_size.x), -50)
	
	add_child(hazard1)
	add_child(hazard2)
	print("Spawned hazard1 at:", hazard1.position)
	print("Spawned hazard2 at:", hazard1.position)


func _on_editor_state_changed() -> void:
	pass # Replace with function body.
