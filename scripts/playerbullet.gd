extends Area2D
class_name Bullet

@export var speed = 300
var direction = -1

var spawnpos : Vector2

var alive : bool = true

signal hit
signal score1

func _ready() -> void:
	global_position = spawnpos


func _process(delta: float) -> void:
	position.y += speed * direction * delta


func _on_bulletbody_entered(body: Node2D) -> void:
	if not alive:
		return
	body.queue_free()
	score1.emit()
	alive = false


func _on_bulletlifetimer_timeout() -> void:
	queue_free()
