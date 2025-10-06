extends Area2D

@export var speed: float = 100 # pixels/sec
func keep_player_onscreen():
	# Limit player movement to stay on screen
	var half_width = 16
	var half_height = 16

	var screen_width = get_viewport_rect().size.x
	var screen_height = get_viewport_rect().size.y
	
	position.x = clamp(position.x, half_width, screen_width - half_width)
	position.y = clamp(position.y, half_height, screen_height - half_height)


func player_controls(delta):
	var velocity = Vector2.ZERO
	
	# Base upward float
	var base_up = speed
	
	# Input
	if Input.is_action_pressed("move_down"):
		velocity.y = speed # Constant downward speed
	else:
		velocity.y = -base_up # Float up

	if Input.is_action_pressed("move_up"):
		velocity.y -= speed * 0.8 # Extra boost
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		
	# Normalize input for diagonal movement
	if velocity.x != 0 and velocity.y != 0:
		velocity = velocity.normalized() * speed

	# Move player
	position += velocity * delta
	
	# Clamp to screen
	var half_size = $Sprite2D.texture.get_size() / 2
	var screen_size = get_viewport_rect().size
	position.x = clamp(position.x, half_size.x, screen_size.x - half_size.x)
	position.y = clamp(position.y, half_size.y, screen_size.y - half_size.y)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	# Keeps the player from going out of bounds
	#keep_player_onscreen()
	
	player_controls(delta)
	
