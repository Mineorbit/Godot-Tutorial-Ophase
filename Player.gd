extends CharacterBody2D


var vertical_velocity = 0

@export_node_path("Node") var levelPath

@onready var level = get_node(levelPath)

@onready var model = $Model


func _physics_process(delta):
	var horizontal_velocity = (600 - position.x)
	vertical_velocity -= 15
	velocity = Vector2(horizontal_velocity,-vertical_velocity)
	var contact = move_and_slide()
	print(contact)
	
	print(vertical_velocity)
	print(is_on_floor())
	if(is_on_floor()):
		vertical_velocity = -1
	if(contact):
		motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED
		if(level.scrolling):
			model.set_animation(1)
	# TUTORIAL CODE
	
	if Input.is_action_just_pressed("jump") and contact:
		jump()
	


func jump():
	model.set_animation(2)
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	vertical_velocity = 6*100
