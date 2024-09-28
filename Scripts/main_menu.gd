extends Node2D


@onready var first_time = $CanvasLayer/ColorRect/lang

@onready var lang = $CanvasLayer/VBoxContainer/lang

var first_lang = Global.cur_lang
var sel_lang = ""

func _ready():
	$AudioStreamPlayer.play(Global.music_time)
	add_lang(first_time)
	add_lang(lang)
	if Global.cur_lang == "English":
		$CanvasLayer/VBoxContainer/lang.select(0)
	elif Global.cur_lang == "Hindi":
		$CanvasLayer/ColorRect/lang.select(1)
	if Global.cur_lang == "English":
		$CanvasLayer/ColorRect/lang.select(0)
	elif Global.cur_lang == "Hindi":
		$CanvasLayer/VBoxContainer/lang.select(1)

func _on_play_pressed():
	if $player_name.text == "":
		get_tree().change_scene_to_file("res://Scenes/world.tscn")
	Global.player_name = $player_name.text
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _process(delta):
	print(Global.cur_lang)
	Global.music_time = $AudioStreamPlayer.get_playback_position()


func _on_mcq_pressed():
	get_tree().change_scene_to_file("res://Scenes/mcq.tscn")

func add_lang(selected_lang : OptionButton) -> void:
	for i in Global.lang:
		selected_lang.add_item(i)




func _on_lang_item_selected(index):
	if $CanvasLayer/VBoxContainer/lang.get_item_text($CanvasLayer/VBoxContainer/lang.get_selected_id()) != first_lang:
		Global.cur_lang = $CanvasLayer/VBoxContainer/lang.get_item_text($CanvasLayer/VBoxContainer/lang.get_selected_id())
		$CanvasLayer/ColorRect.visible = false
	else:
		$CanvasLayer/ColorRect.visible = false
		Global.cur_lang = first_lang
