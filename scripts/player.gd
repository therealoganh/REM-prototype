extends CharacterBody2D

@export var speed = 150
@onready var _animated_player = $AnimatedSprite2D

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide()

func _ready():
	_animated_player.play("float")
