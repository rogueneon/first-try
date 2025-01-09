extends State
class_name walkstate


@export var idle_state: State
@export var jump_state: State
@export var fall_state: State
@export var dash_state: State
@export var dashdirless_state: State
@export var wall_state: State
@export var death_state: State


func enter() -> void:
	super()
	print("switch")
	#dash_count = 0
#
	#if Input.is_action_pressed("left"):
		#left = true
		#right = false
	#if Input.is_action_pressed("right"):
		#right = true
		#left = false


func process_input(event: InputEvent) -> State:
	#var input = Input.get_axis("left","right")
	#
	#if parent.is_on_floor():
		#if Input.is_action_just_pressed("jump"):
			#return jump_state
#
	#if Input.is_action_just_pressed("dash") and dash_count < max_dash:
		#return dash_state

	return null

func process_physics(delta: float) -> State:
	#if parent.velocity.x != 0:
		#parent.animations.flip_h = parent.velocity.x < 0
#
	#grav(delta)
	#move()
	#parent.move_and_slide()
#
	#var input = Input.get_axis("left","right")
	#if !parent.is_on_floor():
		#return fall_state
#
	#if !input:
		#return idle_state
#
	#if parent.is_on_wall_only():
		#return wall_state

	return null

#func move():
	#super()
#
#func grav(delta):
	#super(delta)
