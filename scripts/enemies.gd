# parent class for all enemies
extends CharacterBody2D
class_name Enemy

@onready var mainscene = get_tree().get_root().get_node("main")
var enemybullet = preload("res://scenes/enemybullet.tscn")

# sets health, status and count variables for enemies
var health: int = 100
var alive : bool = true
var enemycount : int = 15
var canshoot : bool = true


func _ready() -> void:
	add_to_group("enemies")
	$ebullet_timer.wait_time = randf_range(2.0, 4.0)
	$ebullet_timer.start()


# create bullet from enemy position
func shoot():
	var ebullet_instance = enemybullet.instantiate()
	ebullet_instance.direction = 1
	ebullet_instance.spawnpos = global_position
	mainscene.add_child.call_deferred(ebullet_instance)


# when takes damage
func takedamage(amount: int):
	health -= amount


# when enemy dies
func ondeath():
	get_parent().enemydied()
	queue_free()
	alive = false
	canshoot = false
