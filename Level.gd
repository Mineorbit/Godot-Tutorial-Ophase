extends AnimatableBody2D

var scrolling = false

var scroll_speed = 128


func _physics_process(delta):
	if(scrolling):
		constant_linear_velocity = -Vector2.RIGHT * scroll_speed
		global_position -= Vector2.RIGHT * scroll_speed * delta
	else:
		global_position = Vector2.ZERO
