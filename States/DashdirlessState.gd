extends State

@export var fall_state: State
@export var walk_state: State
@export var jump_state: State
@export var idle_state: State
@export var wall_state: State
@export var dashdirless_state: State
@export var death_state: State



func enter() -> void:
	super()
	#print(dash_count)
	print("ddl")
	#%Dashingtimer.start()

func process_input(event: InputEvent) -> State:
	#if parent.is_on_floor() && Input.is_action_just_pressed("jump"):
		#dash_count = 0
		#return jump_state
	#if Input.is_action_just_pressed("dash") and dash_count < max_dash:
		#dash_count += 1
		#return dashdirless_state

	return null

func process_physics(delta: float) -> State:
	#dashdirless()
	#parent.move_and_slide()
	

#
	#if %Dashingtimer.time_left == 0.0:
		#if !parent.is_on_floor() && !parent.is_on_wall():
			#return fall_state
		#elif parent.is_on_floor():
			#return walk_state
		#elif parent.is_on_wall():
			#return wall_state
	return null


#func dashdirless():
	#if left:
		#parent.velocity.x += -dash_speed
		#parent.velocity.y = 0
	#if right:
		#parent.velocity.x += dash_speed
		#parent.velocity.y = 0
