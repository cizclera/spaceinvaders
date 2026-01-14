extends CharacterBody2D
class_name Player

@onready var main = get_tree().get_root().get_node("main")
@onready var playerbullet = preload("res://scenes/playerbullet.tscn")
@onready var playerbomb = preload("res://scenes/playerbomb.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var appeared : bool = false
var appearspeed : int = 100
var ydirection : int = -1
var defaulty : int = 700

var playercanshoot : bool = true
var canthrowbomb : bool = true

var canplay : bool = false


func _ready():
	global_position.y = 820
	$playershoottimer.start()
	$bombtimer.start()


func _physics_process(delta: float) -> void:
	if appeared == false:
		global_position.y += appearspeed * ydirection * delta
		if global_position.y <= defaulty:
			appeared = true
			canplay = true
	
	if canplay:
		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if Input.is_action_just_pressed("shoot") and playercanshoot == true:
		shoot()
		$playershoottimer.start()
		playercanshoot = false
	
	if Input.is_action_just_pressed("bomb") and canthrowbomb == true:
		throwbomb()
		$bombtimer.start()
		canthrowbomb = false


func shoot():
	var bullet_instance = playerbullet.instantiate()
	bullet_instance.direction = -1
	bullet_instance.spawnpos = global_position
	main.add_child.call_deferred(bullet_instance)


func throwbomb():
	var bomb_instance = playerbomb.instantiate()
	bomb_instance.direction = -1
	bomb_instance.spawnpos = global_position
	main.add_child.call_deferred(bomb_instance)


func _on_playershoottimer_timeout() -> void:
	playercanshoot = true
	$playershoottimer.stop()


func _on_bombtimer_timeout() -> void:
	canthrowbomb = true
	$bombtimer.stop()
