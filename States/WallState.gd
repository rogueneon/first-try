extends State

@export var fall_state: State
@export var jump_state: State
@export var walk_state: State
@export var dash_state: State
@export var dashdirless_state: State
@export var walljump_state: State
@export var death_state: State

func enter():
	super()
	print("w")
	#if Input.is_action_pressed("left"):
		#left = true
		#right = false
	#if Input.is_action_pressed("right"):
		#right = true
		#left = false
	#print("wall")
	


func process_input(event: InputEvent) -> State:
	#var dashdirinput = Input.get_vector("left","right","down","up")
	#var input = Input.get_axis("left","right")
	#
	#if parent.get_wall_normal().x == input:
		#return fall_state
	#
	#if Input.is_action_just_pressed("dash") and dash_count < max_dash:
		#return dash_state
	#if Input.is_action_just_pressed("jump"):
		#return walljump_state
	#if Input.is_action_just_pressed("dash") and parent.get_wall_normal().x:
		#return dashdirless_state
	
	
	return null



func process_physics(delta: float) -> State:
	#Wall_grav()
	#parent.move_and_slide()
	#
	#
	#if parent.is_on_floor():
		#return walk_state
	#if !parent.is_on_wall():
		#return fall_state
	return null
	


#func Wall_grav():
	#super()
#
#func move():
	#super()
