extends ParallaxLayer


var SPEED = -7

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.motion_offset.x += SPEED * delta
