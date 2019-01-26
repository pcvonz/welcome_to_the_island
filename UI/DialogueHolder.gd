extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#dictionary would definatly be best for this. 
var dialog100
var dialog101
var dialog = load("res://UI/Dialogue.gd")
#var KarmaClass

func _ready():
	#grab karma class...
	dialog100 = dialog.new("Bill", ["Hello my name is Bill!", "Can you guess what my favorite food is?", "EGGS!"])
	dialog101 = dialog.new("Bill", ["Hmmmm.... I wonder what I'm going to do today...", "Any suggestions?"])
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func retrieveDialog(dName):
	#if karma.isFirstInstance = true
		#return dialog100
	return dialog100