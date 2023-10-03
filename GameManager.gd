extends Node2D

@onready var level = $Env/Level
var game_started = false
func start_game():
	if game_started:
		return
	game_started = true
	level.scrolling = true
	


func _process(delta):
	if(Input.is_action_just_pressed("start")):
		start_game()
