extends AnimatableBody2D

var scrolling = true

var scroll_speed = 128


func _physics_process(delta):
	if(scrolling):
		constant_linear_velocity = -Vector2.RIGHT * scroll_speed
		global_position -= Vector2.RIGHT * scroll_speed * delta
