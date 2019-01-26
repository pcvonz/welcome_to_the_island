extends "res://CharacterBase/MovingEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var map = get_node("../Navigation2D") 
var path = []
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	while path.size() > 0:
		var distance_to = self.position.distance_to(path[0])
		print(distance_to)
		if self.position.distance_to(path[0]) > 2:
			var vec_to = self.position - path[0]
			vec_to = vec_to.normalized() * MAX_SPEED
			print(vec_to)
			move_and_collide(vec_to)
		else:
			path.remove(0)
		
func _input(event):
	if event.is_action_pressed('click'):
		path = map.get_simple_path(self.position, event.position)
		print(path)
		
			

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
