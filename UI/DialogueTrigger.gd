extends Node

#THIS CLASS WILL BE PUT ON AN NPC SO THAT IT WILL TRIGGER A DIALOG ON INTERACTION. 
#it will attatch a dialog to the dialog manager. 

var diagHolder
var diagManager



func _ready():
	#diagHolder = $"DialogBox/DialogHolder"
	var diagManager = get_node("/root/Node/DialogBox")
	var diagHolder = get_node("/root/Node/DialogBox/DialogHolder")
	#var targetDialog = self.connect("pressed", diagHolder, "retrieveDialog", ["dialogue"])
	
	self.connect("pressed", diagManager, "startDialogue" )
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

