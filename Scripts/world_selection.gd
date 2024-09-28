extends Node2D

var player_name

func _ready():
	$AudioStreamPlayer.play(Global.music_time)
	$for_new/LineEdit.grab_focus()


func _process(delta):
	
	Global.music_time = $AudioStreamPlayer.get_playback_position()
	
	if $for_new.visible == true:
		if Input.is_action_just_pressed("enter"):
			player_name = $for_new/LineEdit.text
			if player_name != '':
				Global.player_name = player_name
				get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_create_pressed():
	player_name = $for_new/LineEdit.text
	if player_name != '':
		Global.player_name = player_name
		get_tree().change_scene_to_file("res://Scenes/world.tscn")
