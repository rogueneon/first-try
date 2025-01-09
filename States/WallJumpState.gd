extends State


@export var fall_state: State
#@export var jump_state: State
#@export var walk_state: State
@export var dash_state: State
@export var dashdirless_state: State
#@export var wall_state: State



func enter() -> void:
	super()
	print("switch")
	#if Input.is_action_pressed("left"):
		#left = true
		#right = false
	#if Input.is_action_pressed("right"):
		#right = true
		#left = false

func process_physics(delta: float) -> State:
	#var input = Input.get_vector("left","right","down","up")
	##if wall_holding:
		##parent.velocity.x = parent.get_wall_normal().x * wall_jump_x + 100 * input.x #if hold on wall and timeleft > 0
		##parent.velocity.y = wall_jump_y
	#if input.x:
		#parent.velocity.x = parent.get_wall_normal().x * wall_jump_x + 80 * input.x #if input
		#parent.velocity.y = wall_jump_y + 100
	#else:
		#parent.velocity.x = parent.get_wall_normal().x * wall_jump_x #if jump is pressed
		#parent.velocity.y = wall_jump_y
	#parent.move_and_slide()
	#return fall_state
	
	
	
	
	
	return null
