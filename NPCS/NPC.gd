extends "res://CharacterBase/MovingEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var map = get_node("/root/Node2D/Navigation2D") 
var path = []
export var npc_func = "_go_to_random_pos"

func _ready():
	$Node2D/Timer.connect("timeout", self, npc_func)

func update_heading(pos):
	var angle = self.position.angle_to_point(pos)
	$Node2D/Viewport/player/Position3D.rotation.y = angle + (PI / 2)

func _go_to_random_pos():
	if path.size() == 0:
		randomize()
		var cells = map.get_node("TileMap").get_used_cells()
		var rand_cell = randi() % cells.size()
		var rand_pos = map.get_node("TileMap").map_to_world(cells[rand_cell])
		rand_pos = map.get_closest_point(rand_pos)
		path = map.get_simple_path(self.position, rand_pos)

func _process(delta):
	if path.size() > 0:
		var distance_to = self.position.distance_to(path[0])
		if self.position.distance_to(path[0]) > 2:
			var vec_to = path[0] - self.position
			vec_to = vec_to.normalized() * MAX_SPEED
			move_and_collide(vec_to)
			if self.position.distance_to(path[0]) > 1:
				update_heading(path[0])
		else:
			path.remove(0)
