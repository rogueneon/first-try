extends Control






func _on_chapter_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Flow/Scene/Chapter 1/lvl_1.tscn")
	Melons.Securedmelons = 0
	Melons.totalmelons = 0
	Melons.RoomMelons = 0
	Player.Total_deaths = 0

func _on_chapter_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Flow/Scene/Chapter 1/lvl_2.tscn")


func _on_chapter_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Flow/Scene/Chapter 1/lvl_3.tscn")


func _on_chapter_4_pressed() -> void:
	get_tree().change_scene_to_file("res://Flow/Scene/Chapter 1/lvl_4.tscn")


func _on_chapter_5_pressed() -> void:
	get_tree().change_scene_to_file("res://Flow/Scene/Chapter 1/lvl_5.tscn")


func _on_chapter_6_pressed() -> void:
	pass # Replace with function body.
