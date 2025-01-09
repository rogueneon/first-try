class_name State
extends Node

@export
var animation_name: String
#@export
#var gravity := 800
#var fall_gravity := 1000
#var wall_gravity := 600
#
#var jump := 280
#var small_jump := 80
#
#var wall_jump_x := 280
#var wall_jump_y := -250
#
#var max_jump := 2
#var curr_jump := 0
#
#var walk_speed := 240
#var decel := 0.3
#var acceler := 0.05
#
#var air_Speed := 250
#var air_decel := 0.01
#var air_acceler := 0.08
#
#var dash_speed := 50
#var is_dashing = false
#
#static var max_dash := 1
#static var dash_count := 0
#
#static var left = false
#static var right = false
#
#var curr_wallhold = 0
#var max_wallhold = 7
#
#var input = Input.get_vector("left","right","down","up")

var parent: Player


func enter() -> void:
	parent.animations.play(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

#func move():
	#var input = Input.get_axis("left","right")
	#if parent.is_on_floor():
		#if input:
			#if (parent.velocity.x > 50 and input < 0) or (parent.velocity.x < 50 and input > 0):
				#parent.velocity.x = 50 * input
			#parent.velocity.x = move_toward(parent.velocity.x, input * walk_speed, walk_speed * acceler)
		#else:
			#parent.velocity.x = move_toward(parent.velocity.x, 0, walk_speed * decel)
#
#func air_move():
	#var input = Input.get_vector("left","right","down","up")
	#if parent.velocity.x > 50 and Input.is_action_just_pressed("left"):
		#parent.velocity.x = 50
#
	#if parent.velocity.x < -50 and Input.is_action_just_pressed("right"):
		#parent.velocity.x = -50
#
	#if input:
		#parent.velocity.x = move_toward(parent.velocity.x, input.x * air_Speed, air_Speed * air_acceler)
	#else:
		#parent.velocity.x = move_toward(parent.velocity.x, 0, air_Speed * air_decel)
	##if did_air_dash and not is_dashing and abs(parent.parent.parent.velocity.x) > air_Speed:
		##parent.parent.parent.velocity.x = move_toward(parent.parent.parent.velocity.x, sign(parent.parent.parent.velocity.x) * air_Speed, air_decel * delta)
#
#func grav(delta):
	#if parent.velocity.y < 0:
		#parent.velocity.y += gravity * delta
	#else:
		#parent.velocity.y += fall_gravity * delta
#
#func Wall_grav():
		#if parent.velocity.y >= 0:
			#parent.velocity.y = move_toward(parent.velocity.y, 80, 40)
		#if parent.velocity.y <= 0:
			#parent.velocity.y = move_toward(parent.velocity.y, 80, 10)
#
#func Jump(): 
	#parent.velocity.y = -jump
#
#func walljump():
	#var input = Input.get_vector("left","right","down","up")
	#var wall_normal = parent.get_wall_normal()
	#if Input.is_action_just_pressed("jump"):
		#parent.velocity.x = wall_normal.x * wall_jump_x + 100 * input.x
		#parent.velocity.y = wall_jump_y
	#elif input.x:
		#parent.velocity.x = wall_normal.x * wall_jump_x + 80 * input.x
		#parent.velocity.y = wall_jump_y + 100
	#else:
		#parent.velocity.x = wall_normal.x * wall_jump_x
		#parent.velocity.y = wall_jump_y

