extends Area2D




func _on_body_entered(_body: Node2D):
	get_tree().change_scene_to_file("res://Main/Scene/lvl_4.tscn")
	print("hi")

