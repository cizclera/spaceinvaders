extends Area2D
class_name EnemyBullet

@export var speed = 300
var direction = 1

var spawnpos : Vector2

var bulletalive : bool = true


func _ready() -> void:
	global_position = spawnpos


func _process(delta: float) -> void:
	position.y += speed * direction * delta


func _on_ebulletbody_entered(body: Node2D) -> void:
	if not bulletalive:
		return
	if body is Player:
		bulletalive = false


func _on_ebullet_area_entered(area: Area2D) -> void:
	if area is PlayerBullet:
		queue_free()
		area.queue_free()


func _on_bulletlife_timeout() -> void:
	queue_free()
