extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var hoursRemaining
var hourLabel
var stringLabel


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	hourLabel = get_node("ColorRect/timeLabel")
	stringLabel = get_node("ColorRect/stringText")
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
	if(hoursRemaining == 0):
		#gameOverTrigger()
		stringLabel.set_text("hours remaining")
	else:
		resetTimer()

#func gameOverTrigger():
	
