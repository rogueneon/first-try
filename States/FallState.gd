extends State

@export var idle_state: State
@export var walk_state: State
@export var dash_state: State
@export var dashdirless_state: State
@export var wall_state: State
@export var death_state: State


func enter() -> void:
	super()
	print("switch")
	#if Input.is_action_pressed("left"):
		#left = true
		#right = false
	#if Input.is_action_pressed("right"):
		#right = true
		#left = false


func process_input(event: InputEvent) -> State:
	#var dashinput = Input.get_vector("left","right","down","up")
	#if Input.is_action_just_pressed("dash") and dash_count < max_dash and !dashinput:
		#return dashdirless_state
#
	#if Input.is_action_just_pressed("dash") and dash_count < max_dash and dashinput:
		#return dash_state

	return null


func process_physics(delta: float) -> State:
	#if parent.velocity.x != 0:
		#parent.animations.flip_h = parent.velocity.x < 0
#
	#grav(delta)
	#air_move()
	#parent.move_and_slide()
#
	#if parent.is_on_floor():
		#return walk_state
#
	#if parent.is_on_wall_only():
		#return wall_state

	return null

#func air_move():
	#super()
#
#func grav(delta):
	#super(delta)
