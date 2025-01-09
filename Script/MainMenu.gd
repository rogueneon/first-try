class_name MainMenu
extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Flow/Scene/CutScenes/Backround text stuff haha.tscn")
	print("play")



func _on_quit_pressed() -> void:
	get_tree().quit()
	print("quit")
