class_name Idle
extends State

@export var jump_state: State
@export var walk_state: State
@export var dash_state: State
@export var dashdirless_state: State
@export var death_state: State

func enter() -> void:
	super()
	print("switch")
	 #dash_count = 0
	#print(dash_count)


func process_input(event: InputEvent) -> State:
	#if Input.is_action_just_pressed("jump"):
		#return jump_state
#
	#var input = Input.get_axis("left","right")
	#if input:
		#return walk_state
#
	#var dashinput = Input.get_vector("left","right","down","up")
	#if Input.is_action_just_pressed("dash") and dash_count < max_dash and !dashinput:
		#return dashdirless_state
#
	#if Input.is_action_just_pressed("dash") and dash_count < max_dash and dashinput:
		#return dash_state

	return null

func process_physics(delta: float) -> State:
	
	
	
	#grav(delta)
	#if parent.is_on_floor():
		#parent.velocity.x = move_toward(parent.velocity.x, 0, parent.walk_speed * parent.decel)
	#parent.move_and_slide()

	return null

#func grav(delta):
	#super(delta)
