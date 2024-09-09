extends Node2D





func _on_continue_pressed() -> void:
	$".".hide()
	get_tree().paused = false

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Flow/Scene/MainMenu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
