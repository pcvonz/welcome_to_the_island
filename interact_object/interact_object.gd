extends Node2D

export var interact_text = "Press space to build boat"
export var objectName = "Boat"
export(String, FILE) var Scene
onready var dbox = get_node("/root/Node2D/CanvasLayer/DialogBox")
onready var anim = get_node("/root/Node2D/CanvasLayer/AnimationPlayer")
export var anim_string = "fade_out_black"

func switch_scene(a):
	get_node("/root/scene/").goto_scene(Scene)

func end_game():
	if dbox.dialogHolder.isLastConversation():
		dbox.setConversationHead(objectName,"ID2")
		dbox.startDialogue(objectName)
		anim.connect("animation_finished", self, 'switch_scene')
		anim.set_current_animation(anim_string)
		anim.seek(0)
		anim.play()
	else:
		dbox.setConversationHead(objectName,"ID1")
		dbox.startDialogue(objectName)
	