extends CanvasGroup

@onready var sky1 = $Sky1
@onready var sky2 = $Sky2
@onready var sky3 = $Sky3
@onready var sky4 = $Sky4

func background_switcher():
	if Global.score == 0:
		show_only(sky1)
	elif Global.score > 1 and Global.score <= 3:
		show_only(sky2)
	elif Global.score > 3 and Global.score <= 5:
		show_only(sky3)
	elif Global.score > 5:
		show_only(sky4)

func show_only(target: Node):
	for child in [sky1, sky2, sky3, sky4]:
		if child.get_parent() == self:
			remove_child(child)
	
	if target.get_parent() != self:
		add_child(target)
