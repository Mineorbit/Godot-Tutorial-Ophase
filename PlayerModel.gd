extends Node2D

@onready var headAnimator: AnimationPlayer = $HeadAnimator
@onready var bodyAnimation: AnimatedSprite2D = $Body


# 0 idle 1 run 2 jump
func set_animation(state):
	if(state == 0):
		headAnimator.play("idle")
		bodyAnimation.play("idle")
	if(state == 1):
		headAnimator.play("run")
		bodyAnimation.play("run")
	if(state == 2):
		headAnimator.play("run")
		bodyAnimation.play("jump")

func _ready():
	set_animation(0)
