extends Node2D


signal playstart


func _on_playbutton_pressed() -> void:
	playstart.emit()
	get_tree().change_scene_to_file("res://scenes/level1.tscn")
	print("game started")
