extends Area2D
class_name Melons

var total = 0

static var Score = 0
static var RoomMelons = 0
static var Securedmelons = 0
static var totalmelons = 0

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D



func _ready() -> void:
	$AnimatedSprite2D.play("Melon")
	Securedmelons += RoomMelons
	RoomMelons = 0



func _on_body_entered(_body: Node2D) -> void:
	RoomMelons += 1
	totalmelons = RoomMelons + Securedmelons
	Score += 100
	print(RoomMelons)
	print(Score)
	$AnimatedSprite2D.play("Pickup")
	collision_shape_2d.queue_free()
	
	await $AnimatedSprite2D.animation_finished
	queue_free()
	
