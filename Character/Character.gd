extends "res://CharacterBase/MovingEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var rotate = 0
var withinNpcInteractionArea = false;
onready var current_selected_npc = get_node('../cat')
var current_direction = Vector2(0, -1)
onready var talk_hint = get_node('/root/Node2D/CanvasLayer/talk_hint')

func _ready():
	var area2D = get_node("Area2D");
#	area2D.connect("area_entered", self, "on_area_entered");
#	area2D.connect("area_exited", self, "on_area_exited");

func on_area_entered(area):
	var areas = $Area2D.get_overlapping_areas()
	reset_talk_hint_and_highlight(areas)
	update_selected_body(areas)

func on_area_exited(area):
	var areas = $Area2D.get_overlapping_areas()
	reset_talk_hint_and_highlight(areas)
	talk_hint.text = ""
	update_selected_body(areas)
	area.get_parent().get_node("highlight").hide()

func update_selected_body(areas):
	reset_highlight()
	if areas.size() > 0:
		var closest_body = get_closest_body(areas)
		current_selected_npc = closest_body
		current_selected_npc.get_node("highlight").show()
		talk_hint.text = "Press space to talk to " + current_selected_npc.npc_name
	else:
		current_selected_npc = null
		talk_hint.text = ""

func reset_highlight():
	var npcs = get_tree().get_nodes_in_group("npc")
	for npc in npcs:
		npc.get_node("highlight").hide()

func get_closest_body(areas):
	var closest_body = areas[0].get_parent()
	for area in areas:
		var body = area.get_parent()
		area.get_parent().get_node("highlight").hide()
		if position.distance_to(body.position) < position.distance_to(closest_body.position):
			closest_body = body
	return closest_body

func update_talk_hint(name):
	talk_hint.text = "Press space to talk to " + name

func move_character(speed):
	move_and_slide(speed)
	player.get_node("Position3D").rotation_degrees.y = rotate
	if not anim.is_playing():
		anim.play('Armature|mixamo.com|Layer0')

func _process(delta):
	var areas = $Area2D.get_overlapping_areas()
	update_selected_body(areas)
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
	if Input.is_action_just_pressed("ui_select") and current_selected_npc:
		get_tree().paused = true
		if (current_selected_npc.npc_name == "Gigi-Jay"):
			get_node('/root/Node2D/CanvasLayer/DialogBox/').setConversationHead(current_selected_npc.npc_name,"ID1")
		get_node('/root/Node2D/CanvasLayer/DialogBox/').startDialogue(current_selected_npc.npc_name)
		talk_hint.text = ""
