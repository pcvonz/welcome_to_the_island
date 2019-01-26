extends Control

# class member variables go here, for example:
# var a = 2
var nameText
var sentenceText
var counter

var continueButton


var sentenceArray = []
var dialogHolder 


# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	nameText = get_node("ColorRect/name_border/NameText")
	sentenceText = get_node("ColorRect/SentenceText")
	continueButton = get_node("ColorRect/ContinueRec/continue")
	continueButton.connect("button_down", self, "getNextSentence")
	
	dialogHolder = get_node("DialogHolder")
	
	hide()
	
	
	pass
	
func startDialogue():
	var dialog = dialogHolder.retrieveDialog()
	sentenceArray.clear()
	counter = 0
	var name = dialog.getName()
	nameText.bbcode_text = "[center] " + name + " [/center]"
	sentenceArray = dialog.getSentences()
	getNextSentence()
	show()
	
func getNextSentence():
	if counter < sentenceArray.size():
		sentenceText.bbcode_text = "[center] " + sentenceArray[counter] + " [/center]"
		counter = counter +1
	else:
		endDialogue()
		
		
func endDialogue():
	hide()
	


	
	
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass