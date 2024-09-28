extends Panel


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func  _detail(rank : String , name : String , score : String):
	$rank.text = rank
	$name.text = name
	$score.text = score
