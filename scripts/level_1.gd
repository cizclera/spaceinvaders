# handles enemy group movement
extends Node2D
class_name Level1

@onready var main = get_tree().get_root().get_node("main")

var SPEED = 80
var DIR = 1

var leftlimit: int = 250
var rightlimit : int = 750
var drop : int = 30

var enemycount : int = 0

signal levelcomplete


# counts number of enemies at level start
func _ready() -> void:
	enemycount = get_tree().get_nodes_in_group("enemies").size()
	print("Level starting with ", enemycount, " enemies")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x += SPEED * DIR * delta
	if global_position.x <= leftlimit:
		DIR = 1
		global_position.y += drop
		
	if global_position.x >= rightlimit:
		DIR = -1
		global_position.y += drop


func enemydied():
	enemycount -= 1
	print("Enemies remaining: ", enemycount)
	if enemycount <= 0:
		level_complete()


func level_complete():
	print("level completed!")
	levelcomplete.emit()
