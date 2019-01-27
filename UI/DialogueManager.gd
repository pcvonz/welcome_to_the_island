extends Control

# class member variables go here, for example:
# var a = 2
var nameText
var sentenceText
var counter
export(String, FILE) var goodScene

var continueButton
var response1Button
var response2Button


var sentenceArray = []
var dialogHolder 

var currentNPC = "Sunbreeze"


# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	nameText = get_node("ColorRect/name_border/NameText")
	sentenceText = get_node("ColorRect/SentenceText")
	continueButton = get_node("ColorRect/ContinueRec/continue")
	#continueButton.connect("button_down", self, "getNextSentence", ["NPC1", 0])
	
	response1Button = get_node("ColorRect/Option1Rec/option1")
	#response1Button.connect("button_down", self, "getNextSentence", ["NPC1", 0])
	
	response2Button = get_node("ColorRect/Option2Rec/option2")
	#response2Button.connect("button_down", self, "getNextSentence", ["NPC1", 1])
	dialogHolder = get_node("DialogHolder")
	
	#startDialogue("NPC1")
	
	hide()
	
	
	pass
	
func startDialogue(name):
	currentNPC = name
	var dialog = dialogHolder.retrieveDialog(name)
	if (dialog == null):
		if dialogHolder.isLastConversation() && currentNPC != "Amelie":
			startDialogue("Amelie")
			return
#			get_node("/root/scene/").goto_scene(goodScene)
		get_tree().paused = false
		hide()
		return
	
	displayName(name)
	displaySentence(dialog["Sentence"])
	displayResponses(dialog["Responses"])
	show()

func displayName(name):
	nameText.bbcode_text = "[center] " + name + " [/center]"

func displaySentence(sentence):
	sentenceText.bbcode_text = "[center] " + sentence + " [/center]"

func displayResponses(responses):
	match(responses.size()):
		0:
			continue
		1:
			response1Button.get_parent().hide()
			response2Button.get_parent().hide()
			continueButton.get_parent().show()
		2:
			response1Button.text = responses[0]
			response2Button.text = responses[1]
			response1Button.get_parent().show()
			response2Button.get_parent().show()
			continueButton.get_parent().hide()
		_:
			print("*******************TOO MANY RESPONSES*******************")

func getNextSentence(name, response):
	dialogHolder.responseToNPC(name, response)
	startDialogue(name)
		
		
func endDialogue():
	hide()
	

func setConversationHead(npcName,ID):
	dialogHolder.setConversationHead(npcName,ID)
	
	
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_continue_pressed():
	getNextSentence(currentNPC,0)


func _on_option1_pressed():
	getNextSentence(currentNPC,0)


func _on_option2_pressed():
	getNextSentence(currentNPC,1)

