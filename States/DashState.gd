extends State

@export var fall_state: State
@export var walk_state: State
@export var jump_state: State
@export var idle_state: State
@export var wall_state: State
@export var death_state: State



func enter() -> void:
	super()
	#%Dashingtimer.start()
	#dash_count += 1
	#print(dash_count)
	print("dash")
	

func process_input(event: InputEvent) -> State:
	#if parent.is_on_floor() && Input.is_action_just_pressed("jump"):
		#dash_count = 0
		#return jump_state 
	
	
	
	return null

func process_physics(delta: float) -> State:
	#dashdir()
	#if parent.is_on_floor():
		#if parent.velocity.x > 400 or parent.velocity.x < -400:
			#return walk_state
		#parent.velocity.x = move_toward(parent.velocity.x,0,0)
#
	#parent.move_and_slide()
	#if %Dashingtimer.time_left == 0.0:
		#if !parent.is_on_floor() && !parent.is_on_wall():
			#return fall_state
		#elif parent.is_on_floor():
			#return walk_state
		#elif parent.is_on_wall():
			#return wall_state
	return null


#func dashdir():
	#var input = Input.get_vector("left","right","down","up")
#
	#if input.x >= 1:
		#parent.velocity.x += dash_speed
		#parent.velocity.y = 0
	#if input.x <= -1:
		#parent.velocity.x -= dash_speed
		#parent.velocity.y = 0
	#if input.y >= 1:
		#parent.velocity.x = 0
		#parent.velocity.y = -dash_speed - 200
	#if input.y <= -1:
		#parent.velocity.x = 0
		#parent.velocity.y = +dash_speed + 200
#
	#if Input.is_action_pressed("up") and Input.is_action_pressed("right"):
		#parent.velocity.x = dash_speed + 200
		#parent.velocity.y = -dash_speed - 100
	#if Input.is_action_pressed("up") and Input.is_action_pressed("left"):
		#parent.velocity.x = -dash_speed - 200
		#parent.velocity.y = -dash_speed - 100
	#if Input.is_action_pressed("down") and Input.is_action_pressed("right"):
		#parent.velocity.x = dash_speed + 200
		#parent.velocity.y = +dash_speed + 200
	#if Input.is_action_pressed("down") and Input.is_action_pressed("left"):
		#parent.velocity.x = -dash_speed - 200
		#parent.velocity.y = +dash_speed + 200
