extends Node


var lastlocation
var player

func _ready() -> void:
	player = get_parent().get_node("Player")
	lastlocation = player.global_position
