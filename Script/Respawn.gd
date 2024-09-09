extends Area2D
var checkpointmanager
var player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	checkpointmanager = get_parent().get_node("CheckpointManager")
	player = get_parent().get_node("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func kill():
	player.position = checkpointmanager.lastlocation

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		kill()
