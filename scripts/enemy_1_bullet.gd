extends Area2D
class_name EnemyBullet

@export var speed = 300
var direction = 1

var spawnpos : Vector2

signal hitplayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawnpos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * direction * delta


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body is Player:
		hitplayer.emit()
