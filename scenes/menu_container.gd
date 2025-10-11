extends VBoxContainer

@onready var start_button = $Start
@onready var quit_button = $Exit

func _ready():
	start_button.pressed.connect(_on_start_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	
	#Connect signals for hover
	start_button.mouse_entered.connect(_on_start_mouse_entered)
	start_button.mouse_exited.connect(_on_start_mouse_exited)
	quit_button.mouse_entered.connect(_on_exit_mouse_entered)
	quit_button.mouse_exited.connect(_on_exit_mouse_exited)


func _on_start_pressed():
	print("Start pressed!")
	get_tree().change_scene_to_file("res://scenes/main.tscn")
#
func _on_quit_pressed():
	get_tree().quit()

func _on_start_mouse_entered() -> void:
	start_button.modulate = Color(0.8, 0.8, 0.8)

func _on_start_mouse_exited() -> void:
	start_button.modulate = Color(1, 1, 1)

func _on_exit_mouse_entered() -> void:
	quit_button.modulate = Color(0.8, 0.8, 0.8)

func _on_exit_mouse_exited() -> void:
	quit_button.modulate = Color(1, 1, 1)
