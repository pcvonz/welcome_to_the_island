extends MapAction
export(String, FILE, "*.json") var dialogue_file_path : String
class DialogueAction:
	
	signal dialog_loaded(data)
	
	func interact()-> void:
		var dialogue : Dictionary = load_dialogue(dialogue_file_path) 
		yeild (local_map.play_dialogue(dialogue), "completed")
		emit_signal("finished")
		
		
	func load_dialogue(file_path) -> Dictionary:
		#passes .json returns as a dictionary
		var file = File.new()
		assert file.file_exists(file_path)
		file.open(file_path, file.READ)
		var dialogue = parse_json(file.get_as_text)
		assert dialogue.size()>0
		return dialogue
	


