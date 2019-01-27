extends Node

var _sentences = {}
var currentID = null

func _init(sentences):
	for sentence in sentences:
		if currentID == null:
			currentID = sentence.ID
		_sentences[sentence.ID] = {"Sentence":sentence.Sentence,"Responses":sentence.Responses}

func getCurrentSentence():
	return _sentences[currentID]["Sentence"]

func getCurrentResponses():
	var responses = []
	for response in _sentences[currentID]["Responses"]:
		responses.append(response["Response"])
	return responses
	
func responseReceived(response):
	if (response < _sentences[currentID]["Responses"].size()):
		if (_sentences[currentID]["Responses"][response] != null && _sentences[currentID]["Responses"][response].has("NextSentence")):
			currentID = _sentences[currentID]["Responses"][response]["NextSentence"]
		else:
			currentID = null
			
func dialogPending():
	if (currentID != null):
		return true
	else: 
		return false

func setConversationHead(ID):
	currentID = ID