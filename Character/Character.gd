extends "res://CharacterBase/MovingEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var prev_position = self.position
var rotate = 0
onready var anim = player.get_node('AnimationPlayer')

func move_character(speed, rotation):
	move_and_slide(speed)
	player.get_node("Position3D").rotation_degrees.y = rotation
	if not anim.is_playing():
		anim.play('Armature|mixamo.com|Layer0')

func _process(delta):
	var direction = Vector2(0, 0)
	if Input.is_action_pressed("ui_left"):
		direction += left
		rotate = 90
	if Input.is_action_pressed("ui_right"):
		rotate = -90
		direction += right
	if Input.is_action_pressed("ui_up"):
		rotate = 180
		direction += up
	if Input.is_action_pressed("ui_down"):
		rotate = 0
		direction += down
	move_character(direction.normalized()*MAX_SPEED, rotate)
	if self.position == self.prev_position:
		anim.stop()
		anim.seek(0)
	prev_position = self.position