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


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	hourLabel = get_node("ColorRect/timeLabel")
	stringLabel = get_node("ColorRect/stringText")
	canvasModulate = get_node("ColorModulate")
	
	var night = Color(132.93, 135.91, 155.39)
	var dusk = Color(207.19, 168.24, 118.16)
	var day = Color (255, 255, 255)
	var dawn = Color(207.19, 128.59, 118.16)
	var storm = Color(124.55, 0 , 164.36)
	
	hoursRemaining = 48
	resetTimer()
	pass
	
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
	if hoursRemaining == 42 || 18:
		canvasModulate.color(dusk)
	if hoursRemaining == 36 || 12:
		canvasModulate.color(night)
	if hoursRemaining == 30 || 6:
		canvasModulate.color(dawn)
	if hoursRemaining == 3:
		canvasModulate.color(storm)
	
	
	
	
	
	if(hoursRemaining == 0):
		#gameOverTrigger()
		stringLabel.set_text("hours remaining")
	else:
		resetTimer()

#func gameOverTrigger():
	
