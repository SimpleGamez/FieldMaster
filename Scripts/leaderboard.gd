extends Node2D

var player_data = preload("res://Scenes/player_data.tscn")

var data : Array = [
	{"Sno": 1, "Name": "Iris", "No": 99},
	{"Sno": 2, "Name": "Wendy", "No": 97},
	{"Sno": 3, "Name": "Paul", "No": 96},
	{"Sno": 4, "Name": "Ian", "No": 95},
	{"Sno": 5, "Name": "Leo", "No": 94},
	{"Sno": 6, "Name": "Clara", "No": 93},
	{"Sno": 7, "Name": "Fiona", "No": 92},
	{"Sno": 8, "Name": "Oliver", "No": 91},
	{"Sno": 9, "Name": "Rachel", "No": 90},
	{"Sno": 10, "Name": "Ella", "No": 89},
	{"Sno": 11, "Name": "Diana", "No": 88},
	{"Sno": 12, "Name": "Ursula", "No": 88},
	{"Sno": 13, "Name": "Nathan", "No": 86},
	{"Sno": 14, "Name": "Alice", "No": 85},
	{"Sno": 15, "Name": "Frank", "No": 84},
	{"Sno": 16, "Name": "Nora", "No": 83},
	{"Sno": 17, "Name": "Yvonne", "No": 82},
	{"Sno": 18, "Name": "Steve", "No": 81},
	{"Sno": 19, "Name": "Julia", "No": 80},
	{"Sno": 20, "Name": "George", "No": 78},
	{"Sno": 21, "Name": "Amy", "No": 76},
	{"Sno": 22, "Name": "Jack", "No": 75},
	{"Sno": 23, "Name": "Laura", "No": 74},
	{"Sno": 24, "Name": "Tina", "No": 73},
	{"Sno": 25, "Name": "Bob", "No": 72},
	{"Sno": 26, "Name": "Daniel", "No": 71},
	{"Sno": 27, "Name": "Kyle", "No": 69},
	{"Sno": 28, "Name": "Xavier", "No": 68},
	{"Sno": 29, "Name": "Edward", "No": 67},
	{"Sno": 30, "Name": "Quentin", "No": 66},
	{"Sno": 31, "Name": "Grace", "No": 65},
	{"Sno": 32, "Name": "Rose", "No": 64},
	{"Sno": 33, "Name": "Victor", "No": 63},
	{"Sno": 34, "Name": "Quinn", "No": 62},
	{"Sno": 35, "Name": "Hannah", "No": 61},
	{"Sno": 36, "Name": "Maya", "No": 60},
	{"Sno": 37, "Name": "Mike", "No": 59},
	{"Sno": 38, "Name": "Xena", "No": 58},
	{"Sno": 39, "Name": "Zach", "No": 57},
	{"Sno": 40, "Name": "Henry", "No": 56},
	{"Sno": 41, "Name": "Ulysses", "No": 51},
	{"Sno": 42, "Name": "Vanessa", "No": 46},
	{"Sno": 43, "Name": "William", "No": 52},
	{"Sno": 44, "Name": "Tracy", "No": 98},
	{"Sno": 45, "Name": "George", "No": 78},
	{"Sno": 46, "Name": "Steve", "No": 81},
	{"Sno": 47, "Name": "Karen", "No": 70},
	{"Sno": 48, "Name": "Maya", "No": 60},
	{"Sno": 49, "Name": "Nathan", "No": 86},
	{"Sno": 50, "Name": "Julia", "No": 80}
]

var data_index : int = 0
var count : int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var add_player = player_data.instantiate()
	add_player._detail(str(data[data_index]["Sno"]),data[data_index]["Name"],str(data[data_index]["No"]))
	$CanvasLayer/ScrollContainer/VBoxContainer.add_child(add_player)
	data_index += 1
	
	$CanvasLayer/Player_rank/Label2.text = ($CanvasLayer/Player_rank/Label2.text + " " + (Global.player_name)).to_upper()
	$CanvasLayer/Player_rank/Label3.text = ($CanvasLayer/Player_rank/Label3.text + " " + str(Global.rank)).to_upper()
	$CanvasLayer/Player_rank/Label4.text = ($CanvasLayer/Player_rank/Label4.text + " " + str(Global.score)).to_upper()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if data_index > 50 - 1:
		$Timer.stop()

func _on_timer_timeout() -> void:
	var add_player = player_data.instantiate()
	add_player._detail(str(data[data_index]["Sno"]),data[data_index]["Name"],str(data[data_index]["No"]))
	$CanvasLayer/ScrollContainer/VBoxContainer.add_child(add_player)
	data_index = data_index + 1
