extends Node

export(String) var question
export(Array, String) var responses
export(bool) var isCritical

var decision


func MakeDecision(myDecision):
	decision = myDecision

func GetQuestion():
	return question

