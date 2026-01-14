extends CharacterBody2D
class_name Enemy1

@onready var main = get_tree().get_root().get_node("main")

signal collided
signal hit

var SPEED = 100
var DIR = 1

var alive : bool = true
var descending : bool = true
var limitpassed : bool = false
var spawning : bool = true

var leftlimit : int = 50
var rightlimit : int = 1450
var drop : int = 120


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if alive and descending:
		global_position.y += SPEED * DIR * delta
		if global_position.y >= 50:
			descending = false
	if alive and not descending:
		global_position.x += SPEED * DIR * delta
		if global_position.x <= leftlimit and not descending:
			DIR = 1
			global_position.y += drop
		
		if global_position.x >= rightlimit and not descending:
			DIR = -1
			global_position.y += drop


func _on_area_2d_area_entered(area: Area2D) -> void:
	if not alive:
		return
	#if descending:
		#return
	hit.emit()
	alive = false
