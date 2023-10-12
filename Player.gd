extends CharacterBody2D


var vertical_velocity = 0

@export_node_path("Node") var levelPath

@onready var level = get_node(levelPath)

@onready var model = $Model
var last_dif = 0
var speed = 0


func _physics_process(delta):
	if(level.scrolling):
		var horizontal_velocity = (600 - position.x)
		vertical_velocity -= 10
		velocity = Vector2(horizontal_velocity,-vertical_velocity)
		var contact = move_and_slide()
		if(is_on_floor()):
			vertical_velocity = -1
		if(contact):
			motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED
		# TUTORIAL CODE
		speed = ((position.x - level.position.x) - last_dif)/delta
		last_dif = (position.x - level.position.x)
		if(contact):
			if(speed > 5):
				model.set_animation(1)
			else:
				model.set_animation(0)
		if Input.is_action_just_pressed("jump") and contact:
			jump()
	else:
		model.set_animation(0)
	


func jump():
	model.set_animation(2)
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	vertical_velocity = 6*100
