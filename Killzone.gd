extends Area2D

@export_node_path("Node2D") var mainPath

@onready var main = get_node(mainPath)

func on_body_entered(body):
	if body is CharacterBody2D:
		main.GameOver()
