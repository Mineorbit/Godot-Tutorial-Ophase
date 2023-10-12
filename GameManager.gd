extends Node2D

@onready var level = $Env/Level
@onready var env = $Env
@onready var player = $Env/Entities/Player
@onready var counter: RichTextLabel = $Env/Counter
@onready var gameOver = load("res://GameOver.tscn").instantiate()
var game_started = false


func start_game():
	if game_started:
		return
	game_started = true
	level.scrolling = true
	env.remove_child(gameOver)


func GameOver():
	print("GAMEOVER")
	level.scrolling = false
	player.position = Vector2(110,510)
	env.add_child(gameOver)
	count = 0
	game_started = false


var count = 0

func _process(delta):
	if game_started:
		count += delta
		counter.text = str(floor(count))
	if(Input.is_action_just_pressed("start")):
		start_game()
