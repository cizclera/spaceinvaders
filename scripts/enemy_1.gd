#handles collision, score, and shooting ig
extends Enemy
class_name BasicEnemy


@onready var main = get_tree().get_root().get_node("main")
signal enemyhit
var alive: bool = true

# checks for collision with bullet
func _on_collisionarea_body_entered(body: Node2D) -> void:
	if not alive:
		return
	if body is Bullet:
		queue_free()
		enemyhit.emit()
		alive = false
