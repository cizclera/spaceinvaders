extends Node2D


signal restart


func _on_restartmenu_pressed() -> void:
	restart.emit()
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
	print("returning to main menu")
