extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_pressed("Start"):
		get_tree().change_scene_to_file("res://Flow/Scene/Chapter Select.tscn")
