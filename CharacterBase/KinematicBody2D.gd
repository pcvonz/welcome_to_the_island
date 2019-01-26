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
onready var character = get_node("Node2D/Viewport/player/Armature")

func _ready():
  pass

func _input(event):
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(left*MAX_SPEED)
		character.rotation_degrees.y = -90
	if Input.is_action_pressed("ui_right"):
		move_and_collide(right*MAX_SPEED)
		character.rotation_degrees.y = 90
	if Input.is_action_pressed("ui_up"):
		move_and_collide(up*MAX_SPEED)
		character.rotation_degrees.y = 180
	if Input.is_action_pressed("ui_down"):
		move_and_collide(down*MAX_SPEED)
		character.rotation_degrees.y = 0