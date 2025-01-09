extends Control
class_name Chapter

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Start"):
		pass

func _ready() -> void:
	pass

func _on_chapter_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Flow/Scene/Chapter 1/lvl_1.tscn")

func _on_chapter_2_pressed() -> void:
	pass # Replace with function body.

func _on_chapter_3_pressed() -> void:
	pass # Replace with function body.

func _on_chapter_4_pressed() -> void:
	pass # Replace with function body.

func _on_chapter_5_pressed() -> void:
	pass # Replace with function body.

func _on_chapter_6_pressed() -> void:
	pass # Replace with function body.

func _on_v_box_container_tab_button_pressed(tab: int) -> void:
	pass # Replace with function body.

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Flow/Scene/MainMenu.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Flow/Scene/Chapter 2.tscn")
