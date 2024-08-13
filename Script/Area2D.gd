extends Area2D

@export var next_lvl : PackedScene

# Called when the node enters the scene tree for the first time.
func _on_area_2d_area_entered(area):
	get_tree().change_scene_to_packed(next_lvl)
	print("detect")
