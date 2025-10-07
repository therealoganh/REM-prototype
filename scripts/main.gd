extends Node2D

@export var sheep_scene: PackedScene
@export var spawn_interval: float = 3
var timer: float = 0.0

func _ready():
	if sheep_scene == null:
		print("ERROR: No sheep scene assigned!")
	else:
		print("Spawner ready – will spawn every", spawn_interval, "seconds")

func _process(delta):
	
	# timer logic
	timer -= delta
	if timer <= 0:
		spawn_sheep()
		timer = spawn_interval

func spawn_sheep():

	var sheep = sheep_scene.instantiate()
	
	sheep.z_index = 10
	var screen_size = get_viewport_rect().size
	sheep.position = Vector2(randf_range(0, screen_size.x), -50)
	
	add_child(sheep)
	print("Spawned sheep at:", sheep.position)
