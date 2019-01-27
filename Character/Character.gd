extends "res://CharacterBase/MovingEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var prev_position = self.position
var rotate = 0
var withinNpcInteractionArea = false;
var body
onready var anim = player.get_node('AnimationPlayer')

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
	body.get_node("highlight").show()
	

func on_area_exited(area):
	print("goodbye area");
	withinNpcInteractionArea = false;
	body.get_node("highlight").hide()
	body = null

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
	
	if Input.is_action_just_pressed("ui_select") and withinNpcInteractionArea:
		get_tree().paused = true
		get_node('/root/Node2D/CanvasLayer/DialogBox/').startDialogue(body.npc_name)
		
		
		