extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(String, FILE) var Scene

var hoursRemaining
var hourLabel
var stringLabel
var night
var dusk
var day
var dawn
var canvasModulate
var storm 
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#github please work
	hourLabel = get_node("ColorRect/timeLabel")
	stringLabel = get_node("ColorRect/stringText")
	canvasModulate = get_node("/root/Node2D/CanvasModulate")
	
	night = Color("#5d67d2")
	dusk = Color("#ff9789")
	day = Color ("#FFFFFF")
	dawn = Color("#ffcfa5")
	storm = Color("#c000ff")
	
	hoursRemaining = 48
	canvasModulate.color = day
	resetTimer()

func resetTimer():
	set_wait_time(1)
	start()
	connect("timeout", self, "onTimeoutComplete")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func onTimeoutComplete():
	#also there can be a way to change the color of the day/ night cycle. 
	hoursRemaining = hoursRemaining - 1
	hourLabel.set_text( str(hoursRemaining))
	if hoursRemaining ==1:
		stringLabel.set_text("hour remaining")
	#below changes colors at certain points
	if hoursRemaining == 42 or hoursRemaining == 18:
		canvasModulate.color = dusk
	if hoursRemaining == 36 or hoursRemaining == 12:
		canvasModulate.color = night
	if hoursRemaining == 30 or hoursRemaining == 6:
		canvasModulate.color = dawn
	if hoursRemaining == 48 or hoursRemaining == 24:
		canvasModulate.color = day
	if hoursRemaining == 3:
		canvasModulate.color = storm
	
	
	
	
	
	if(hoursRemaining == 0):
		#gameOverTrigger()
		stringLabel.set_text("hours remaining")
		get_node("/root/scene/").goto_scene(Scene)
	else:
		disconnect("timeout", self, "onTimeoutComplete")
		resetTimer()

#func gameOverTrigger():
	
