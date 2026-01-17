#handles bullet direction, status and collision with enemy
extends Area2D
class_name Bullet

@export var speed = 300
var direction = -1

var spawnpos : Vector2

var bulletalive : bool = true

signal hit
signal score

func _ready() -> void:
	global_position = spawnpos


func _process(delta: float) -> void:
	position.y += speed * direction * delta


func _on_bulletbody_entered(body: Node2D) -> void:
	if not bulletalive:
		return
	if body is Enemy:
		body.queue_free()
		queue_free()
		score.emit()
		bulletalive = false


func _on_bulletlifetimer_timeout() -> void:
	queue_free()
