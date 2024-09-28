extends Area2D

var hoed_field = false
var seed_placed = false
var watered = false
var harvest = false


func _ready():
	$TextureProgressBar.visible = false
	$Sprite2D.visible = true

func _hoed():
	if hoed_field == false:
		hoed_field = true
		$FarmLand2.visible = false
		$Sprite2D.visible = false
		$Sprite2D2.visible = true


func show_t():
	$Timer.wait_time = Global.hoe_time
	$TextureProgressBar.visible = true
	$Timer.start()

func show_f():
	$TextureProgressBar.visible = false

func water():
	if hoed_field == true and watered == false:
		$Timer.wait_time = Global.water_time
		$TextureProgressBar.visible = true
		$AnimationPlayer.play("getting_watered")
		watered = true
		$Timer.start()
		

func water_done():
	if seed_placed == true:
		seed_growing()

func show_s():
	if hoed_field == true:
		$Timer.wait_time = Global.seeding_time
		$TextureProgressBar.visible = true
		$Timer.start()

func seeded():
	if hoed_field == true:
		$Sprite2D.visible = false
		$Sprite2D2.visible = false
		watered = false
		$SeededSoil.visible = true
		seed_placed = true

func harvest_av():
	if harvest == true:
		$Sickle2.visible = false
		$TextureProgressBar.visible = true
		$Timer.wait_time = Global.harvest_time
		$Timer.start()


func harvesting():
	if $Timer.time_left == 0:
		hoed_field = false
		seed_placed = false
		watered = false
		$Node2D.visible = false
		$FarmLand2.visible = true
	

func seed_growing():
	$TextureProgressBar.visible = true
	$SeededSoil.visible = false
	$Sprite2D2.visible = true
	$Node2D.visible = true
	$Timer.wait_time = 15
	$Timer.start()
	$Node2D/AnimatedSprite2D.play("wheat_grow")
	$Node2D/AnimatedSprite2D2.play("wheat_grow")
	$Node2D/AnimatedSprite2D3.play("wheat_grow")
	$Node2D/AnimatedSprite2D4.play("wheat_grow")
	$Node2D/AnimatedSprite2D5.play("wheat_grow")
	$Node2D/AnimatedSprite2D6.play("wheat_grow")
	$Node2D/AnimatedSprite2D7.play("wheat_grow")
	$Node2D/AnimatedSprite2D8.play("wheat_grow")
	$Node2D/AnimatedSprite2D9.play("wheat_grow")
	

func _process(delta):
	$TextureProgressBar.max_value = $Timer.wait_time
	$TextureProgressBar.min_value = 0
	$TextureProgressBar.value = ($Timer.wait_time - $Timer.time_left)


func _on_timer_timeout():
	$TextureProgressBar.visible = false
	if $Timer.wait_time == Global.water_time:
		water_done()

func _on_animated_sprite_2d_animation_finished():
	$Sickle2.visible = true
	harvest = true
