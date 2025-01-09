extends CharacterBody2D
class_name Player

#region Vars


#region Movement vars
var gravity := 800
var fall_gravity := 1000
var wall_gravity := 600

var jump := 270
var small_jump := 80

var wall_jump_x := 280
var wall_jump_y := -250

var max_jump := 2
var curr_jump := 0

var walk_speed := 240
var decel := 0.3
var acceler := 0.05

var air_Speed := 250
var air_decel := 0.01
var air_acceler := 0.08

var dash_speed := 50
var is_dashing = false

var max_dash := 1
var dash_count := 0

var curr_wallhold = 0
var max_wallhold = 7
#endregion

#region Timers
@onready var dashingtimer: Timer = %Dashingtimer
@onready var wall_hold_timer: Timer = $WallHoldTimer
@onready var death_timer: Timer = $DeathTimer
@onready var decel_timer: Timer = $DecelTimer
@onready var hold_timer: Timer = $HoldTimer
#endregion

var jump_buffer_timer: float = 0.2
var jump_buffer = false
var jump_buff_time = 0.15

static var Total_deaths = 0
var Reset = 0


#region T/F vars
var did_air_dash = true
var is_wall_holding = false
var was_wall_holding = false
var left = false
var right = false
#endregion

var up = Input.is_action_pressed("up")
var down = Input.is_action_pressed("down")

@onready var starting = global_position
@onready var coyote = %coyote
#endregion

@onready var animations = $AnimatedSprite2D
@onready var state_manager = $StateManager

var input = Input.get_vector("left","right","down","up")

#func _ready() -> void:
	#decel_timer.connect("timeout", timerdecel)
	#%Dashingtimer.connect("timeout", End_Dash)
	#death_timer.connect("timeout", die)

func _ready() -> void:
	death_timer.connect("timeout", die)
	state_manager.init(self)
	decel_timer.connect("timeout", timerdecel)
	%Dashingtimer.connect("timeout", End_Dash)

func _unhandled_input(event: InputEvent) -> void:
	state_manager.process_input(event)

func _physics_process(delta: float) -> void:
	state_manager.process_physics(delta)


	if Input.is_action_just_pressed("left"):
		left = true
		right = false
	if Input.is_action_just_pressed("right"):
		right = true
		left = false

	Engine.time_scale = 1

	if Input.is_action_just_pressed("jump"):
		if is_on_floor() or coyote.time_left > 0.0 and curr_jump < max_jump:
			Jump()
			curr_jump += 1
		else:
			jump_buffer = true
			jump_buffer_timer = jump_buff_time


	if jump_buffer:
		jump_buffer_timer -= delta
		if jump_buffer_timer <= 0.0:
			jump_buffer = false
	if jump_buffer and is_on_floor():
		jump_buffer = false
		Jump()

	if Input.is_action_just_released("jump") and velocity.y < -150:
		velocity.y += small_jump

	var input = Input.get_vector("left","right","down","up")

	if Input.is_action_just_pressed("dash"):
		if !is_dashing and dash_count < max_dash:
			if is_on_floor():
				if velocity.x < 300 and velocity.x > -300:
					Dash(input)
			else:
				dash_count += 1
				Dash(input)

	if is_dashing:
		if !input:
			No_Dash_direct()
		else:
			Dash_direct(input)
		decel = 0
		decel_timer.start()

	if is_on_floor():
		dash_count = 0
		curr_wallhold = 0
		curr_jump = 0
		Melons.Securedmelons += Melons.RoomMelons
		Melons.RoomMelons = 0

	if Reset == 0:
		if is_on_floor():
			move(input)
		else:
			if is_on_wall_only() and Input.is_action_pressed("hold"):
				animations.play("Wall")

			else:
				air_move(input,delta)
	else:
		move_and_slide()

	walljump(input)

	was_wall_holding = is_wall_holding
	if is_on_wall_only() and Input.is_action_pressed("hold"):
		is_wall_holding = true
	elif !is_on_wall_only():
		is_wall_holding = false
	if hold_timer.get_time_left() == 0:
		is_wall_holding = false

	wall_hold(input,delta)

	var was = is_on_floor()
	move_and_slide()
	var just_left = was and not is_on_floor() and velocity.y >= 0
	if just_left:
		coyote.start()

	if Reset >= 1:
		animations.play("Death")
		velocity.y = -20
		velocity.x = 0
	else:
		animtion(input,delta)

	if Input.is_action_just_pressed("Scene Reset"):
		get_tree().reload_current_scene()

	if is_on_wall_only():
		Wall_grav()
	else:
		grav(delta)

func _process(delta: float) -> void:
	state_manager.process_frame(delta)




#func _physics_process(delta):
	#if Input.is_action_just_pressed("left"):
		#left = true
		#right = false
	#if Input.is_action_just_pressed("right"):
		#right = true
		#left = false
		#
	#Engine.time_scale = 1
	#
	#if Input.is_action_just_pressed("jump"):
		#if is_on_floor() or coyote.time_left > 0.0 and curr_jump < max_jump:
			#Jump()
			#curr_jump += 1
		#else:
			#jump_buffer = true
			#jump_buffer_timer = jump_buff_time
	#if jump_buffer:
		#jump_buffer_timer -= delta
		#if jump_buffer_timer <= 0.0:
			#jump_buffer = false
	#if jump_buffer and is_on_floor():
		#jump_buffer = false
		#Jump()
#
	#if Input.is_action_just_released("jump") and velocity.y < -150:
		#velocity.y += small_jump
	#
	#var input = Input.get_vector("left","right","down","up")
	#
	#if Input.is_action_just_pressed("dash"):
		#if !is_dashing and dash_count < max_dash:
			#if is_on_floor():
				#if velocity.x < 300 and velocity.x > -300:
					#Dash(input)
			#else:
				#dash_count += 1
				#Dash(input)
#
	#if is_dashing:
		#if !input:
			#No_Dash_direct()
		#else:
			#Dash_direct(input)
		#decel = 0
		#decel_timer.start()
#
	#if is_on_floor():
		#dash_count = 0
		#curr_wallhold = 0
		#curr_jump = 0
		#Melons.Securedmelons += Melons.RoomMelons
		#Melons.RoomMelons = 0
#
	#if Reset == 0:
		#if is_on_floor():
			#move(input)
		#else:
			#if is_on_wall_only() and Input.is_action_pressed("hold"):
				#animations.play("Wall")
				#
			#else:
				#air_move(input,delta)
	#else:
		#move_and_slide()
#
	#walljump(input)
#
	#was_wall_holding = is_wall_holding
	#if is_on_wall_only() and Input.is_action_pressed("hold"):
		#is_wall_holding = true
	#elif !is_on_wall_only():
		#is_wall_holding = false
	#if hold_timer.get_time_left() == 0:
		#is_wall_holding = false
#
	#wall_hold(input,delta)
#
	#var was = is_on_floor()
	#move_and_slide()
	#var just_left = was and not is_on_floor() and velocity.y >= 0
	#if just_left:
		#coyote.start()
#
	#if Reset >= 1:
		#animations.play("Death")
		#velocity.y = -20
		#velocity.x = 0
	#else:
		#animtion(input,delta)
#
	#if Input.is_action_just_pressed("Scene Reset"):
		#get_tree().reload_current_scene()
#
	#if is_on_wall_only():
		#Wall_grav()
	#else:
		#grav(delta)

func move(input):
	if input.x:
		if (velocity.x > 50 and input.x < 0) or (velocity.x < 50 and input.x > 0):
			velocity.x = 50 * input.x
		velocity.x = move_toward(velocity.x, input.x * walk_speed, walk_speed * acceler)
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed * decel)

func air_move(input,delta):
	if velocity.x > 50 and Input.is_action_just_pressed("left"):
		velocity.x = 50

	if velocity.x < -50 and Input.is_action_just_pressed("right"):
		velocity.x = -50

	if input:
		velocity.x = move_toward(velocity.x, input.x * air_Speed, air_Speed * air_acceler)
	else:
		velocity.x = move_toward(velocity.x, 0, air_Speed * air_decel)
	if did_air_dash and not is_dashing and abs(velocity.x) > air_Speed:
		velocity.x = move_toward(velocity.x, sign(velocity.x) * air_Speed, air_decel * delta)

func grav(delta):
	if velocity.y < 0:
		velocity.y += gravity * delta
	else:
		velocity.y += fall_gravity * delta

func Wall_grav():
		if velocity.y >= 0:
			velocity.y = move_toward(velocity.y, 80, 40)
		if velocity.y <= 0:
			velocity.y = move_toward(velocity.y, 80, 10)

func Jump():
	velocity.y = -jump

func walljump(input):
	if not is_on_wall_only(): return
	var wall_normal = get_wall_normal()
	if Input.is_action_just_pressed("jump"):
		if Input.is_action_pressed("hold") and hold_timer.get_time_left() > 0:
			velocity.x = wall_normal.x * wall_jump_x + 100 * input.x #if hold on wall and timeleft > 0
			velocity.y = wall_jump_y
		elif input.x:
			velocity.x = wall_normal.x * wall_jump_x + 80 * input.x #if input
			velocity.y = wall_jump_y + 100
		else:
			velocity.x = wall_normal.x * wall_jump_x #if jump is pressed
			velocity.y = wall_jump_y

func wall_hold(input,delta):
	if hold_timer.is_connected("timeout",Holdtime):
		hold_timer.connect("timeout",Holdtime)
	if is_wall_holding and !was_wall_holding:
		hold_timer.set_paused(false)
		hold_timer.start(hold_timer.time_left)
	if Input.is_action_pressed("hold") and Input.is_action_just_pressed("jump") and hold_timer.get_time_left() >= 0.002:
		hold_timer.start(max(hold_timer.get_time_left() -2, 0.001))
		hold_timer.set_paused(true)
		return walljump(input)
	if is_wall_holding and Input.is_action_pressed("hold"):
		if Input.is_action_pressed("up"):
			velocity.y = -20
		elif Input.is_action_pressed("down"):
			velocity.y = 20
		else:
			velocity.y = 0

	if is_on_floor_only():
		hold_timer.start(11)
		hold_timer.set_paused(true)

func Holdtime():
	is_wall_holding = false

func Dash(input):
	#var velocity_in_input_dir = input * velocity.dot(input)
	#velocity = velocity_in_input_dir
	is_dashing = true
	%Dashingtimer.start()

func End_Dash():
	is_dashing = false

func animtion(input,delta):
	if velocity.x != 0:
		animations.flip_h = velocity.x < 0
	if input.x != 0 and is_on_floor():
		animations.play("Run")
	elif is_dashing:
		animations.play("Dash")
	elif is_on_wall_only() and Input.is_action_pressed("hold"):
		animations.play("Grab")
		var wall_normal = get_wall_normal()
		animations.flip_h = wall_normal.x >0
		if input.x >= 1 and wall_normal.x > 0:
			animations.play("Wall")
			animations.flip_h = wall_normal.x >0
		if input.x <= -1 and wall_normal.x < 0:
			animations.play("Wall")
			animations.flip_h = wall_normal.x >0
	elif is_on_wall_only():
		animations.play("Wall")
		var wall_normal = get_wall_normal()
		animations.flip_h = wall_normal.x > 0
	elif velocity.y < 0:
		animations.play("Jump")
	elif velocity.y > 0:
		animations.play("Fall")
	else:
		animations.play("Idle")

#region onredy markers
@onready var marker1: Marker2D = $"../Checkpoints/Check 1/Marker2D"
@onready var marker2: Marker2D = $"../Checkpoints/Check 2/Marker2D"
@onready var marker3: Marker2D = $"../Checkpoints/Check 3/Marker2D"
@onready var marker4: Marker2D = $"../Checkpoints/Check 4/Marker2D"
@onready var marker5: Marker2D = $"../Checkpoints/Check 5/Marker2D"
@onready var marker6: Marker2D = $"../Checkpoints/Check 6/Marker2D"
@onready var marker7: Marker2D = $"../Checkpoints/Check 7/Marker2D"
@onready var marker8: Marker2D = $"../Checkpoints/Check 8/Marker2D"
@onready var marker9: Marker2D = $"../Checkpoints/Check 9/Marker2D"
@onready var marker10: Marker2D = $"../Checkpoints/Check 10/Marker2D"
@onready var markers = [marker1,marker2,marker3,marker4,marker5,marker6,marker7,marker8,marker9,marker10]
@onready var realivepos = marker1.global_position
#endregion

func die():
	animations.play("Death")
	global_position = realivepos
	Reset = 0

func deathzone(area : Area2D) -> void:
	Reset += 1
	Total_deaths += 1
	death_timer.start()
	#Melons.RoomMelons = 0
	#Melons.totalmelons = Melons.RoomMelons + Melons.Securedmelons

func Dash_direct(input):
	if is_dashing:

#region Unused dash
		#velocity += Vector2(input.x * dash_speed, -input.y * dash_speed)

		#velocity += Vector2(input.x * dash_speed, -input.y * dash_speed)
		#
		#if input.y == 0:
			#velocity.y = 0
		#if input.x == 0:
			#velocity.x = 0


		#velocity.x *= abs(input.x)
		#velocity.y *= abs(input.y)
#endregion

		if input.x >= 1:
			velocity.x += dash_speed
			velocity.y = 0
		if input.x <= -1:
			velocity.x -= dash_speed
			velocity.y = 0
		if input.y >= 1:
			velocity.x = 0
			velocity.y = -dash_speed - 200
		if input.y <= -1:
			velocity.x = 0
			velocity.y = +dash_speed + 200

		if Input.is_action_pressed("up") and Input.is_action_pressed("right"):
			velocity.x = dash_speed + 200
			velocity.y = -dash_speed - 100
		if Input.is_action_pressed("up") and Input.is_action_pressed("left"):
			velocity.x = -dash_speed - 200
			velocity.y = -dash_speed - 100
		if Input.is_action_pressed("down") and Input.is_action_pressed("right"):
			velocity.x = dash_speed + 200
			velocity.y = +dash_speed + 200
		if Input.is_action_pressed("down") and Input.is_action_pressed("left"):
			velocity.x = -dash_speed - 200
			velocity.y = +dash_speed + 200

func timerdecel():
	decel = 0.3

func No_Dash_direct():
	if right:
		velocity.x += dash_speed
		velocity.y = 0
	if left:
		velocity.x -= dash_speed
		velocity.y = 0

