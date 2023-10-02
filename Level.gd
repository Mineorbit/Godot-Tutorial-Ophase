extends AnimatableBody2D

var scroll_speed = 128

func _ready():
	constant_linear_velocity = -Vector2.RIGHT * scroll_speed

func _physics_process(delta):
	global_position -= Vector2.RIGHT * scroll_speed * delta
