
# ScoreLabel.gd (attached to your Label node)
extends Label

func _ready():
	# Connect to the score_changed signal from the Global script
	NewScript.score_changed.connect(on_score_changed)
	# Update the text with the initial score
	text = "Score: " + str(NewScript.score)
	

# This function is called every time the score changes
func on_score_changed(new_score):
	text = "Score: " + str(new_score)
