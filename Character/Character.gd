extends "res://CharacterBase/MovingEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var rotate = 0
var withinNpcInteractionArea = false;
var body
var current_direction = Vector2(0, -1)
onready var talk_hint = get_node('/root/Node2D/CanvasLayer/talk_hint')

func _ready():
	var area2D = get_node("Area2D");
	area2D.connect("area_entered", self, "on_area_entered");
	area2D.connect("area_exited", self, "on_area_exited");

func on_area_entered(area):
	print("hello area");
	withinNpcInteractionArea = true;
	if body:
		body.get_node("highlight").hide()
	body = area.get_parent()
	update_talk_hint(body.npc_name)
	body.get_node("highlight").show()


func on_area_exited(area):
	print("goodbye area");
	withinNpcInteractionArea = false;
	if body:
		body.get_node("highlight").hide()
		body = null
	talk_hint.text = ""

func update_talk_hint(name):
	talk_hint.text = "Press space to talk to " + name

func move_character(speed):
	move_and_slide(speed)
	player.get_node("Position3D").rotation_degrees.y = rotate
	if not anim.is_playing():
		anim.play('Armature|mixamo.com|Layer0')

func _process(delta):
	var direction = Vector2(0, 0)
	if Input.is_action_pressed("ui_left"):
		direction += left
	if Input.is_action_pressed("ui_right"):
		direction += right
	if Input.is_action_pressed("ui_up"):
		direction += up
	if Input.is_action_pressed("ui_down"):
		direction += down
	
	var diagonal_angle = atan(0.5)
	if direction.x != 0 and direction.y != 0:
		direction = Vector2(sign(direction.x) * cos(diagonal_angle), sign(direction.y) * sin(diagonal_angle))
	
	if direction.length() > 0:	
		rotate = rad2deg(down.angle_to(direction))
		current_direction = direction 

	move_character(direction.normalized()*MAX_SPEED)
	update_anim()
	prev_position = self.position
	if Input.is_action_just_pressed("ui_select") and withinNpcInteractionArea:
		get_tree().paused = true
		get_node('/root/Node2D/CanvasLayer/DialogBox/').startDialogue(body.npc_name)
		talk_hint.text = ""
