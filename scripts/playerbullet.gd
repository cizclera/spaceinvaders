# handles bullet direction, status and collision with enemy
extends Area2D
class_name PlayerBullet

@export var speed = 300
var direction = -1

var spawnpos : Vector2

var bulletalive : bool = true


func _ready() -> void:
	global_position = spawnpos


func _process(delta: float) -> void:
	position.y += speed * direction * delta


# handles interaction with enemy, triggers enemy health loss and death
func _on_bulletbody_entered(body: Node2D) -> void:
	if not bulletalive:
		return
	if body is Enemy or body is EnemyBullet:
		queue_free()
		bulletalive = false
		body.takedamage(50)
		if body.health <= 0:
			body.ondeath()


func _on_bulletlifetimer_timeout() -> void:
	queue_free()
