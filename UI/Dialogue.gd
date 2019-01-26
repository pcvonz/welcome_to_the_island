extends Node

var npcName;
var sentences = []
	
func _init(_npcName, _sentences):
	npcName = _npcName
	sentences= _sentences	
	

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func getName():
	return npcName
	
func getSentences():
	return sentences
