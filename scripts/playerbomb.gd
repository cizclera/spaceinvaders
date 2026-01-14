extends Area2D
class_name Bomb


@export var speed = 300
var direction = -1

var spawnpos : Vector2


func _ready() -> void:
	global_position = spawnpos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * direction * delta


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	print("hit!")


func _on_bomblife_timeout() -> void:
	queue_free()
