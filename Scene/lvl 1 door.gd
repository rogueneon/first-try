extends Area2D


# Called when the node enters the scene tree for the first time.



func _on_body_entered(_body: Node2D):
	get_tree().change_scene_to_file("res://Main/Scene/lvl_2.tscn")
	print("hi")
