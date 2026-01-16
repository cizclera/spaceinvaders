extends CharacterBody2D
class_name Player

@onready var main = get_tree().get_root().get_node("main")
@onready var playerbullet = preload("res://scenes/playerbullet.tscn")


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		shoot()


func shoot():
	var bullet_instance = playerbullet.instantiate()
	bullet_instance.direction = -1
	bullet_instance.spawnpos = global_position
	main.add_child.call_deferred(bullet_instance)
