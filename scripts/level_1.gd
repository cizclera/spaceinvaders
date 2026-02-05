# handles enemy group movement for Level 1
extends Node2D
class_name Level1

@onready var main = get_tree().get_root().get_node("main")

var SPEED = 80
var DIR = 1

var leftlimit: int = 250
var rightlimit : int = 750
var drop : int = 30

var enemycount : int = 0

var groupmove : bool = true

signal levelcomplete


# counts number of enemies at level start
func _ready() -> void:
	call_deferred("countenemies")


func countenemies():
	enemycount = get_tree().get_nodes_in_group("enemies").size()
	print("Level starting with ", enemycount, " enemies")


# group movement
func _process(delta: float) -> void:
	if groupmove:
		global_position.x += SPEED * DIR * delta
		if global_position.x <= leftlimit:
			DIR = 1
			global_position.y += drop
		
		if global_position.x >= rightlimit:
			DIR = -1
			global_position.y += drop


# on death (collision with player bullet)
func enemydied():
	enemycount -= 1
	print("Enemies remaining: ", enemycount)
	if enemycount <= 0:
		level_complete()


# when all enemies are finished
func level_complete():
	print("level completed!")
	levelcomplete.emit()


func _on_level_coll_area_body_entered(body: Node2D) -> void:
	if body is Player:
		print("player eliminated")
		groupmove = false
