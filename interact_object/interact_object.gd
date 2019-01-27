extends Node2D

export var interact_text = "Press space to build boat"
export var objectName = "Boat"
export(String, FILE) var Scene
onready var dbox = get_node("/root/Node2D/CanvasLayer/DialogBox")

func end_game():
	if dbox.dialogHolder.isLastConversation():
		dbox.setConversationHead(objectName,"ID2")
		dbox.startDialogue(objectName)
		get_node("/root/scene/").goto_scene(Scene)
	else:
		dbox.setConversationHead(objectName,"ID1")
		dbox.startDialogue(objectName)
	