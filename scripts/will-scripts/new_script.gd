# Global.gd
extends Node

signal score_changed(new_score)
var score: int = 0:
	set(value):
		score = value
		score_changed.emit(score)
