extends Node2D

var enemy1 = preload("res://scenes/enemy_1.tscn")
var enemy2 = preload("res://scenes/enemy_2.tscn")
var enemy1ARR : Array
var enemy2ARR : Array

var enemy1count : int = 15
var enemy1counter : int = 0
var enemy1destroyed : int = 0

var gamerunning = true
var levelrunning = true
var gameover = false

#enemies
var spawning : bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startgame()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func startgame():
	enemy1ARR.clear()
	$enemyspawntimer.start()
	$UI/EnemiesDestroyed.text = "Enemies destroyed: " + str(enemy1destroyed) + "/" + str(enemy1count)
	print("spawn timer started")
	gamerunning = true
	levelrunning = true
	gameover = false


func spawnplayer():
	pass


func spawnenemy1():
	if spawning:
		var enemy1instance = enemy1.instantiate()
		enemy1instance.position.x = 150
		enemy1instance.position.y = -50
		enemy1instance.hit.connect(onhit)
		add_child(enemy1instance)
		enemy1ARR.append(enemy1instance)
		if enemy1ARR.size() >= enemy1count:
			spawning = false
			$enemyspawntimer.stop()
			print("spawning stopped")


func spawnenemy2():
	pass


func onhit():
	# there is some counting error, look into it.
	enemy1destroyed += 1
	$UI/EnemiesDestroyed.text = "Enemies Detroyed: " + str(enemy1destroyed) + "/" + str(enemy1count)
	print("enemies destroyed: ", enemy1destroyed)
	if enemy1count == enemy1destroyed:
		print("game won!")


func stopgame():
	pass


func _on_enemyspawntimer_timeout() -> void:
	if spawning:
		spawnenemy1()
		enemy1counter += 1
		print("spawning enemy: ", enemy1counter)
