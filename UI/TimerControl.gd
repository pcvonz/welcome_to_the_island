extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
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
	
	night = Color("#84879B")
	dusk = Color("#CFA876")
	day = Color (1, 1, 1)
	dawn = Color("#CF8076")
	storm = Color("#7C00A4")
	
	hoursRemaining = 48
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
	if hoursRemaining == 3:
		canvasModulate.color = storm
	
	
	
	
	
	if(hoursRemaining == 0):
		#gameOverTrigger()
		stringLabel.set_text("hours remaining")
	else:
		resetTimer()

#func gameOverTrigger():
	
