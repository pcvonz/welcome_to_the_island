extends Node2D

# Member variables
var viewport = null
var sprite = null
var viewport_sprite = null


# variables for the sprite animation
const MAX_FRAME_FOR_SPITE = 4
const FRAME_SWITCH_TIME = 0.2
var frame_swtich_timer = 0

func _ready():
	viewport = get_node("Viewport")
	viewport_sprite = get_node("Viewport_Sprite")

	# Assign the sprite's texture to the viewport texture
	viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	
	# Let two frames pass to make sure the screen was captured
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	viewport_sprite.texture = viewport.get_texture()
  
	set_process(true)