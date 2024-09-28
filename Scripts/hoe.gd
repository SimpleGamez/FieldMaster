extends Area2D


func _physics_process(delta):
	if Global.has_hoe == true:
		queue_free()


func _on_body_entered(body):
	if body == get_parent().find_child("Player"):
		Global.has_hoe = true
		queue_free()
