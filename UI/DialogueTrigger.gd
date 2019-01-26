extends Node

#THIS CLASS WILL BE PUT ON AN NPC SO THAT IT WILL TRIGGER A DIALOG ON INTERACTION. 
#it will attatch a dialog to the dialog manager. 

var diagHolder
var diagManager

func _ready():
	diagHolder = $"DialogHolder"
	diagManager = $"DialogManager"
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func dialogTriggered():
	diagManager.startDialog(diagHolder.retrieveDialog)
