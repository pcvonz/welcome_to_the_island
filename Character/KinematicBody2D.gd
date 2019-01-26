extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var left = Vector2(-1, 0)
var right = Vector2(1, 0)

export var MAX_SPEED = 4
onready var character = get_node("Node2D/Viewport/player")

func _ready():
  pass

func _input(event):
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(left*MAX_SPEED)

	if Input.is_action_pressed("ui_right"):
		move_and_collide(right*MAX_SPEED)