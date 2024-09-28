extends Node2D

var http_send = HTTPClient.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request("http://10.1.0.237:3001/leaderboard")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	
	print(response[0]["name"])

