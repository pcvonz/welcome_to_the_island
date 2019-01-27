extends Node


var Dialog = load("res://UI/Dialogue.gd")
#var KarmaClass
var dialogList
var selectedDialog

var scriptFile = "res://Script/script.json"
var script
var decisions

var npcList = {}


func _ready():
	LoadScript()


func retrieveDialog(npc):
	if (npcList[npc].dialogPending() == false):
		return null
	
	return {"Sentence":npcList[npc].getCurrentSentence(),"Responses":npcList[npc].getCurrentResponses()}

func responseToNPC(npc, response):
	npcList[npc].responseReceived(response)

	
func LoadScript():
	var file = File.new()
	file.open(scriptFile, File.READ)
	var scriptData = file.get_as_text()
	file.close()
	script = parse_json(scriptData)
	for npc in script:
		npcList[npc.npcName] = Dialog.new(npc.Sentences)
	