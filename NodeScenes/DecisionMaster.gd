extends Node

var decisions

func _ready():
	decisions = get_children()
	print(decisions[0].question)

