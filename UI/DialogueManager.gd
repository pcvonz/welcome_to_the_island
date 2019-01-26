extends Control

# class member variables go here, for example:
# var a = 2
var nameText
var sentenceText
var counter

var continueButton
var yesButton
var noButton

var continueButtonRec
var yesButtonRec
var noButtonRec


var sentenceArray = []
var dialogHolder 


# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	nameText = get_node("ColorRect/name_border/NameText")
	sentenceText = get_node("ColorRect/SentenceText")
	continueButton = get_node("ColorRect/ContinueRec/continue")
	
	continueButtonRec = get_node("ColorRect/ContinueRec")
	yesButtonRec = get_node("ColorRect/Option1Rec")
	noButtonRec = get_node("ColorRect/Option2Rec")
	
	yesButton = get_node("ColorRect/Option1Rec/option1")
	noButton = get_node("ColorRect/Option2Rec/option2")
	
	continueButton.connect("button_down", self, "getNextSentence")
	yesButton.connect("button_down", self, "getNextSentence")
	noButton.connect("button_down", self, "getNextSentence")
	
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
		var targetSentence = sentenceArray[counter]
		if "++" in targetSentence:
			yesButtonRec.show()
			noButtonRec.show()
			continueButtonRec.hide()
		else:
			yesButtonRec.hide()
			noButtonRec.hide()
			continueButtonRec.show()
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