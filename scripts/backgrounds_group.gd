extends CanvasGroup

@onready var sky1 = $Sky1
@onready var sky2 = $Sky2
@onready var sky3 = $Sky3
@onready var sky4 = $Sky4

func background_switcher():
	if Global.score == 0:
		remove_child(sky2)
		remove_child(sky3)
		remove_child(sky4)
	if Global.score > 1:
		remove_child(sky1)
		add_child(sky2)
	if Global.score > 3:
		remove_child(sky2)
		add_child(sky3)
	if Global.score > 5:
		remove_child(sky3)
		add_child(sky4)
