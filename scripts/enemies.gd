# parent class for all enemies
extends CharacterBody2D
class_name Enemy

# sets health, status and count variables for enemies
var health: int = 100
var alive : bool = true
var enemycount : int = 15


func _ready() -> void:
	add_to_group("enemies")


# when takes damage
func takedamage(amount: int):
	health -= amount


# when enemy dies
func ondeath():
	get_parent().enemydied()
	queue_free()
	alive = false
