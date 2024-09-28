extends Node2D



func _ready():
	if Global.cur_lang == "English":
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/MCQ'S.dialogue"), "start")
	elif Global.cur_lang == "Hindi":
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/hindiMCQ's.dialogue"), "start")

func _process(delta):
	if Input.is_action_just_pressed("back"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
