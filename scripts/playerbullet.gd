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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * direction * delta


func _on_body_entered(body: Node2D) -> void:
	if not alive:
		return
	if body is Enemy1:
		body.queue_free()
		score1.emit()
		alive = false
	if body is EnemyBullet:
		body.queue_free()
		alive = false


func _on_life_timeout() -> void:
	queue_free()
