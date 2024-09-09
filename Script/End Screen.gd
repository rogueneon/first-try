class_name End_screen
extends Control

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Flow/Scene/MainMenu.tscn")
	print("Menu")



func _on_quit_pressed() -> void:
	get_tree().quit()
	print("quit")
