extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(String, FILE) var Scene
var gameScene

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	self.connect("button_down", self, "playGame")
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func playGame():
	get_node("/root/scene").goto_scene(Scene)
