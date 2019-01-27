extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(String, FILE) var Scene

func _ready():
	$AnimationPlayer.connect("animation_finished", self, "_change_scene")
	
func _change_scene(name):
	get_node("/root/scene").goto_scene(Scene)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
