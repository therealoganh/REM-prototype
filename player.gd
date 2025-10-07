extends CharacterBody2D

@export var move_speed: float = 200.0
@export var dodge_speed: float = 600.0
@export var dodge_duration: float = 0.2
@export var max_health: int = 3

var health: int
var is_dodging: bool = false
var dodge_direction: Vector2 = Vector2.ZERO

@onready var dodge_timer: Timer = $DodgeTimer

func _ready() -> void:
	health = max_health
	dodge_timer.wait_time = dodge_duration
	dodge_timer.one_shot = true

func _process(delta: float) -> void:
	handle_input()
	if not is_dodging:
		move_and_slide()
	else:
		velocity = dodge_direction * dodge_speed
		move_and_slide()

func handle_input() -> void:
	var input_dir = Vector2.ZERO
	input_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_dir = input_dir.normalized()

	if not is_dodging:
		velocity = input_dir * move_speed

		if Input.is_action_just_pressed("dodge") and input_dir != Vector2.ZERO:
			start_dodge(input_dir)

func start_dodge(direction: Vector2) -> void:
	is_dodging = true
	dodge_direction = direction
	dodge_timer.start()

func _on_DodgeTimer_timeout() -> void:
	is_dodging = false

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("hurt") and not is_dodging:
		take_damage(1)

func take_damage(amount: int) -> void:
	health -= amount
	print("Player hit! Health:", health)
	if health <= 0:
		die()

func die() -> void:
	print("Player died!")
	queue_free()
