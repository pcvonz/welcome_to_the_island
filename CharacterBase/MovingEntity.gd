extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var down = Vector2(0, 1)
var up = Vector2(0, -1)
const SPEED = 10
export var MAX_SPEED = 4
onready var player = get_node("Node2D/Viewport/player")
onready var prev_position = self.position
onready var anim = player.get_node('AnimationPlayer')
#onready var model_root = player.get_node('model').get_node(player.get_character)

func update_anim():
	if self.position == self.prev_position:
		anim.stop()
		anim.seek(0)