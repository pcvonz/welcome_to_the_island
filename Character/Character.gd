extends "res://CharacterBase/MovingEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

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