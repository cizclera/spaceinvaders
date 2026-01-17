#handles enemy group movement
extends Node2D
class_name Level1

@onready var main = get_tree().get_root().get_node("main")

var SPEED = 100
var DIR = 1

var leftlimit: int = 250
var rightlimit : int = 750
var drop : int = 50

var enemycount : int = 10

signal finished

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x += SPEED * DIR * delta
	if global_position.x <= leftlimit:
		DIR = 1
		global_position.y += drop
		
	if global_position.x >= rightlimit:
		DIR = -1
		global_position.y += drop
