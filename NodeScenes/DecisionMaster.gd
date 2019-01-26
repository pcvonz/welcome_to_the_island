extends Node

export(String) var scriptFile
var script
var decisions

func _ready():
	#decisions = get_children()
	#print(decisions[0].question)
	LoadScript()
	print(script)

func LoadScript():
	var file = File.new()
	file.open(scriptFile, File.READ)
	var scriptData = file.get_as_text()
	file.close()
	script = parse_json(scriptData)