extends CharacterBody2D

var speed = 100
var num = 0
var enter = false
var on_hand
var act_tool = 0
var rf_area = null
var  move
var months =["January","February","March","April","May","June","July","August","September","October","November","December"]
@onready var buy_menu = $buy_menu

func _ready():
	$Camera2D/CanvasLayer/calander_time.start()
	$AnimatedSprite2D.animation = "backward"
	$AnimatedSprite2D.frame = 0
	$Camera2D/CanvasLayer/RichTextLabel.text = " Hello " + Global.player_name
	enter = true
	$tool_area.visible = false
	

func _process(delta):
	
	var num : int = ($Camera2D/CanvasLayer/calander_time.wait_time - $Camera2D/CanvasLayer/calander_time.time_left)/5
	$Camera2D/CanvasLayer/Calander_months.text = months[num]
	
	$Camera2D/CanvasLayer/Node2D/Label.text = "= " + str(Global.wheat_bag)
	$buy_menu/Label.text = "= " +  str(Global.wheat_bag)
	$Camera2D/CanvasLayer/Node2D/RichTextLabel.text = "= " + str(Global.coin)

func _physics_process(_delta):
	velocity.y = 0
	velocity.x = 0
	
	if Global.wheat_bag <= 5:
		$buy_menu/wheat_sell.disabled = true
	else:
		$buy_menu/wheat_sell.disabled = false
	
	if $buy_menu.visible == true:
		enter = true

	
	if rf_area == get_parent().find_child("shop") and  Input.is_action_just_pressed("enter"):
		visible = false
		position.y = position.y + 10
		$buy_menu.visible = true
	
	
	if $buy_menu.visible == true and Input.is_action_just_pressed("back"):
		enter = false
		$buy_menu.visible = false
	
	
	if enter == false:
		if Input.is_action_pressed("forward"):
			$AnimatedSprite2D.play("forward")
			velocity.y = -speed
		
		if Input.is_action_pressed("backward"):
			$AnimatedSprite2D.play("backward")
			velocity.y = speed
		
		if Input.is_action_pressed("left"):
			$AnimatedSprite2D.play("left")
			velocity.x = -speed
		
		if Input.is_action_pressed("right"):
			$AnimatedSprite2D.play("right")
			velocity.x = speed
		
		
		if Global.has_hoe == true:
			$Camera2D/CanvasLayer/Slot1/Hoe.visible = true
		
		if Global.has_water == true:
			$Camera2D/CanvasLayer/Slot2/Water.visible = true
		
		if Global.has_wheat == true:
			$Camera2D/CanvasLayer/Slot4/wheat_bag.visible = true
		
		if Global.has_sickle == true:
			$Camera2D/CanvasLayer/Slot3/Sickle2.visible = true
		
		
		if Input.is_action_just_pressed("interact") and act_tool == 1:
			if $AnimatedSprite2D.animation == "left" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = 0
				$tool_area/CollisionShape2D.position.x = -20
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("hoe_left")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.show_t()
				$tool_area/Timer.wait_time = Global.hoe_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
			if $AnimatedSprite2D.animation == "right" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = 0
				$tool_area/CollisionShape2D.position.x = 20
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("hoe_right")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.show_t()
				$tool_area/Timer.wait_time = Global.hoe_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
			if $AnimatedSprite2D.animation == "forward" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = -20
				$tool_area/CollisionShape2D.position.x = 0
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("hoe_up")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.show_t()
				$tool_area/Timer.wait_time = Global.hoe_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
			if $AnimatedSprite2D.animation == "backward" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = 20
				$tool_area/CollisionShape2D.position.x = 0
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("hoe_right")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.show_t()
				$tool_area/Timer.wait_time = Global.hoe_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
		if Input.is_action_just_pressed("interact") and act_tool == 2:
			if $AnimatedSprite2D.animation == "left" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = 0
				$tool_area/CollisionShape2D.position.x = -20
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("water_left")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.water()
				$tool_area/Timer.wait_time = Global.water_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
			if $AnimatedSprite2D.animation == "right" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = 0
				$tool_area/CollisionShape2D.position.x = 20
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("water_right")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.water()
				$tool_area/Timer.wait_time = Global.water_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
			if $AnimatedSprite2D.animation == "forward" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = -20
				$tool_area/CollisionShape2D.position.x = 0
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("water_up")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.water()
				$tool_area/Timer.wait_time = Global.water_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
			if $AnimatedSprite2D.animation == "backward" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = 20
				$tool_area/CollisionShape2D.position.x = 0
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("water_bottom")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.water()
				$tool_area/Timer.wait_time = Global.water_time
				$tool_area/Timer.start()
				get_tree().paused = true
		
		if Input.is_action_just_pressed("interact") and (act_tool == 4 or act_tool == 5):
			if $AnimatedSprite2D.animation == "left" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = 0
				$tool_area/CollisionShape2D.position.x = -20
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("wheat_left")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.show_s()
				$tool_area/Timer.wait_time = Global.seeding_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
			if $AnimatedSprite2D.animation == "right" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = 0
				$tool_area/CollisionShape2D.position.x = 20
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("wheat_right")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.show_s()
				$tool_area/Timer.wait_time = Global.seeding_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
			if $AnimatedSprite2D.animation == "forward" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = -20
				$tool_area/CollisionShape2D.position.x = 0
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("wheat_right")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.show_s()
				$tool_area/Timer.wait_time = Global.seeding_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
			if $AnimatedSprite2D.animation == "backward" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = 20
				$tool_area/CollisionShape2D.position.x = 0
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("wheat_left")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.show_s()
				$tool_area/Timer.wait_time = Global.seeding_time
				$tool_area/Timer.start()
				get_tree().paused = true
		
		if Input.is_action_just_pressed("interact") and act_tool == 3:
			if $AnimatedSprite2D.animation == "left" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = 0
				$tool_area/CollisionShape2D.position.x = -20
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("sickle_left")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.harvest_av()
				$tool_area/Timer.wait_time = Global.harvest_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
			if $AnimatedSprite2D.animation == "right" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = 0
				$tool_area/CollisionShape2D.position.x = 20
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("sickle_right")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.harvest_av()
				$tool_area/Timer.wait_time = Global.harvest_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
			if $AnimatedSprite2D.animation == "forward" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = -20
				$tool_area/CollisionShape2D.position.x = 0
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("sickle_right")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.harvest_av()
				$tool_area/Timer.wait_time = Global.harvest_time
				$tool_area/Timer.start()
				get_tree().paused = true
			
			if $AnimatedSprite2D.animation == "backward" and rf_area != null:
				$tool_area/CollisionShape2D.position.y = 20
				$tool_area/CollisionShape2D.position.x = 0
				$tool_area/CollisionShape2D/AnimatedSprite2D.play("sickle_left")
				$tool_area.visible = true
				if rf_area != null:
					rf_area.harvest_av()
				$tool_area/Timer.wait_time = Global.harvest_time
				$tool_area/Timer.start()
				get_tree().paused = true
		
		if Input.is_action_just_pressed("num1") and Global.has_hoe == true:
			$Camera2D/CanvasLayer/Slot1/ColorRect.visible = true
			$Camera2D/CanvasLayer/Slot1/ColorRect2.visible = true
			$Camera2D/CanvasLayer/Slot2/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot2/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot3/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot3/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot4/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot4/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot5/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot5/ColorRect2.visible = false
			act_tool = 1
		
		if  Input.is_action_just_pressed("num2") and Global.has_water == true:
			$Camera2D/CanvasLayer/Slot1/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot1/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot2/ColorRect.visible = true
			$Camera2D/CanvasLayer/Slot2/ColorRect2.visible = true
			$Camera2D/CanvasLayer/Slot3/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot3/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot4/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot4/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot5/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot5/ColorRect2.visible = false
			act_tool = 2
		
		if  Input.is_action_just_pressed("num3") and Global.has_hoe == true:
			$Camera2D/CanvasLayer/Slot1/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot1/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot2/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot2/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot3/ColorRect.visible = true
			$Camera2D/CanvasLayer/Slot3/ColorRect2.visible = true
			$Camera2D/CanvasLayer/Slot4/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot4/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot5/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot5/ColorRect2.visible = false
			act_tool = 3
		
		if Input.is_action_just_pressed("num4") and Global.has_hoe == true:
			$Camera2D/CanvasLayer/Slot1/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot1/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot2/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot2/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot3/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot3/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot4/ColorRect.visible = true
			$Camera2D/CanvasLayer/Slot4/ColorRect2.visible = true
			$Camera2D/CanvasLayer/Slot5/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot5/ColorRect2.visible = false
			act_tool = 4
		
		if Input.is_action_just_pressed("num5") and Global.has_hoe == true:
			$Camera2D/CanvasLayer/Slot1/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot1/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot2/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot2/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot3/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot3/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot4/ColorRect.visible = false
			$Camera2D/CanvasLayer/Slot4/ColorRect2.visible = false
			$Camera2D/CanvasLayer/Slot5/ColorRect.visible = true
			$Camera2D/CanvasLayer/Slot5/ColorRect2.visible = true
			act_tool = 5
		
	
	
	
	
	velocity.normalized()
	move_and_slide()
	
	if $Camera2D/CanvasLayer/RichTextLabel/Label.visible == true:
		if Input.is_action_just_pressed("enter"):
			$Camera2D/CanvasLayer/RichTextLabel.visible = false
			enter = false
	
	if $Camera2D/CanvasLayer/RichTextLabel.visible == false:
		enter = false


func _on_timer_timeout():
	$tool_area/CollisionShape2D/AnimatedSprite2D.stop()
	get_tree().paused = false
	$tool_area.visible = false
	if rf_area != null and act_tool == 1:
		rf_area.show_f()
		rf_area._hoed()
	if rf_area != null and (act_tool == 4 or act_tool == 5):
		Global.wheat_bag -= 1
		rf_area.seeded()
	if rf_area != null and act_tool == 3:
		Global.wheat_bag += 3
		rf_area.harvesting()
	rf_area = null


func _on_tool_area_area_entered(area):
	rf_area = area



func _on_calander_time_timeout():
	$Camera2D/CanvasLayer/calander_time.start()


func _on_wheat_sell_pressed():
	if Global.wheat_bag > 5:
		Global.wheat_bag -= 5
		Global.coin += 1000


func _on_close_pressed():
	$buy_menu.visible = false


func _on_rain_timing_timeout():
	$Camera2D/CPUParticles2D.emitting = true
	$Camera2D/CPUParticles2D/after_rain.start()


func _on_after_rain_timeout():
	$Camera2D/CPUParticles2D.emitting = false
