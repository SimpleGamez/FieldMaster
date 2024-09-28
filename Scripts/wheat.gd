extends Area2D


func _ready():
	if Global.has_wheat == true:
		queue_free()


func _on_body_entered(body):
	if body == get_parent().find_child("Player"):
		Global.has_wheat = true
		queue_free()

