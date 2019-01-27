extends Node2D

export var interact_text = "Press space to build boat"
export(String, FILE) var Scene
onready var dbox = get_node("/root/Node2D/CanvasLayer/DialogBox")

func end_game():
	pass