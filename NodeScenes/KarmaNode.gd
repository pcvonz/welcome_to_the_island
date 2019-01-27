extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var total_karma = 0
#answer could be an int or a string... depending on time. If string it could be dialog code. 
var answer



func answer_question(answer):
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
