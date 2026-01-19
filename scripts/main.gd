extends Node2D

var enemy1 = preload("res://scenes/enemy_1.tscn")
var level1 = preload("res://scenes/level_1.tscn")


var gamerunning = true
var levelrunning = true
var gameover = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startgame()


func startgame():
	spawnlevel1()
	gamerunning = true
	levelrunning = true
	gameover = false


func spawnlevel1():
	var level1instance = level1.instantiate()
	level1instance.position.x = 500
	level1instance.position.y = 100
	add_child(level1instance)
	level1instance.levelcomplete.connect(on_level_complete)


func on_level_complete():
	print("level complete signal received")
