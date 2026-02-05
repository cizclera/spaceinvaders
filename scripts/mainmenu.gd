extends Node2D


signal playstart


func _ready() -> void:
	get_tree().paused = false


func _on_playbutton_pressed() -> void:
	playstart.emit()
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	print("game started")
