extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var total_karma = 0
var answer

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	if answer is false:
		print('Wrong answer given')
		
	else:
		print('Correct answer given')
		total_karma += 1

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
