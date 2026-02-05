# handles collision, score, and shooting ig
extends Enemy
class_name BasicEnemy


@onready var main = get_tree().get_root().get_node("main")

# custom health and count
func _init() -> void:
	health = 50
	enemycount = 10


func _on_ebullet_timer_timeout() -> void:
	if canshoot:
		shoot()
	else:
		$ebullet_timer.stop()
