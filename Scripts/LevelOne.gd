extends Node2D

var score = 0 setget setScore

func setScore(value):
	score = value
	get_node("Score").set_text("Score: " + str(score) )
	

