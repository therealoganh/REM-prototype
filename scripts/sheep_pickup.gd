extends Area2D

@export var fall_speed: float = 50.0

@onready var sheep = $TopSheep
const BLACK_SHEEP = preload("res://art/Blacksheep.png")

var drift_speed = 20.0
var time = 0.0

func sheep_swap():
	
	if Global.score > 5:
		sheep.texture = BLACK_SHEEP
		

func _process(delta):
	
	sheep_swap()
	
	time += delta
	position.y += fall_speed * delta
	position.x += sin(time * 2.0) * drift_speed * delta

	# remove when offscreen
	var screen_height = get_viewport_rect().size.y
	if position.y > screen_height + 50:
		queue_free()



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Global.score +=1 ; #Increment global score variable
		print("Sheep count:", Global.score)
		queue_free()
