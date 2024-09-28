extends Node2D

var av = false
var enter = false



func _ready():
	
	if Global.cur_lang == "English":
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/tutorial.dialogue"), "start")
	elif Global.cur_lang == "Hindi":
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/hindi.dialogue"), "start")
	
	$AudioStreamPlayer.play(Global.music_time)
	$CanvasLayer.visible = false


func _process(delta):
	
	if Input.is_action_just_pressed("enter") and enter == true:
		enter = false
		_on_resume_pressed()
	
	if Input.is_action_just_pressed("back") and enter == true:
		enter = false
		_on_savetomenu_pressed()
	
	if Input.is_action_just_pressed("back"):
		$CanvasLayer.visible = true
		$Player.enter = true
		enter = true
	


func _on_resume_pressed():
	$CanvasLayer.visible = false
	$Player.enter = false


func _on_area_2d_body_entered(body):
	body.visible = false


func _on_area_2d_body_exited(body):
	body.visible = true


func _on_savetomenu_pressed():
	$Player.enter = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_shop_body_entered(body):
	if body.name == "Player":
		body.buy_menu.visible = true
