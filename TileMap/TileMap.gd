extends Navigation2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("../CanvasModulate").color = Color(.7, .6, .3)