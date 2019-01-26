extends Control

# class member variables go here, for example:
# var a = 2
var nameText
var sentenceText
var counter

var dialogBox

var sentenceArray = []

# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	nameText = $"ColorRect/Name border/NameText"
	sentenceText = get_node("ColorRect/SentenceText")
	
	hide()
	
	
	pass
	
func startDialogue(dialog):
	sentenceArray.clear()
	counter = 0
	nameText.bbcode_text = "[center]" + dialog.getName() + "[/center]"
	sentenceArray = dialog.getSentences()
	getNextSentence()
	show()
	
func getNextSentence():
	if counter < sentenceArray.size():
		sentenceText.bbcode_text = "[center]" + sentenceArray.index(counter) + "[/center]"
		counter += counter
	else:
		endDialogue()
		
		
func endDialogue():
	hide()

	
	
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass