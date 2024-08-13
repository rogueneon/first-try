extends Node2D

@export var next_lvl : PackedScene

func _ready() -> void:
	pass 

func next():
	pass
	get_tree().change_scene_to_packed(next_lvl)


