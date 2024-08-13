extends CharacterBody2D


var gravity = 800
var fall_gravity = 900
var jump = 300
var small_jump = 80
@export var wall_jump_x = 300
var wall_jump_y = -290
var max_dash = 1
var death_count = 0
var dashed = 600
var dash_count = 0
var max_jump = 1
var curr_jump = 0

@export var walk_speed = 150.0
@export_range(0, 1) var decel = 0.1
@export_range(0, 1) var acceler = 0.1

@export var air_Speed = 150.0
@export_range(0, 1) var air_decel = 0.1
@export_range(0, 1) var air_acceler = 0.1

@export var dash_speed = 1000.0
@export var dash_max_distiance = 300.0
@export var dash_curve : Curve
@export var dash_cooldown = 1.0

@export var is_dashing = false
@export var dash_start_positiong = 0
@export var dash_direction = 0
@export var dash_time = 0

@onready var anime = %AnimatedSprite2D
@onready var coyote = %coyote
@onready var starting = global_position


func _physics_process(delta):
	grav(delta)
	Jump()
	var put = Input.get_axis("left", "right")
	dash_ativation(put,delta)
	move(put)
	air_move(put)
	walljump()
	animtion()
	var was = is_on_floor()
	move_and_slide()
	var just_left = was and not is_on_floor() and velocity.y >= 0
	if just_left:
		coyote.start()

func move(put):
	if not is_on_floor(): return
	if put:
		velocity.x = move_toward(velocity.x, put * walk_speed, walk_speed * acceler)
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed * decel)

func air_move(put):
	if is_on_floor(): return
	if put:
		velocity.x = move_toward(velocity.x, put * air_Speed, air_Speed * air_acceler)
	else:
		velocity.x = move_toward(velocity.x, 0, air_Speed * air_decel)

func grav(delta):
	if is_on_floor(): return
	if velocity.y < 0:
		velocity.y += gravity * delta
	else:
		velocity.y += fall_gravity * delta

func Jump():
	if is_on_floor() or coyote.time_left > 0.0:
		if Input.is_action_just_pressed("jump") and curr_jump < max_jump:
			curr_jump += 1
			velocity.y = -jump

	if Input.is_action_just_released("jump") and velocity.y < 0 and curr_jump < max_jump:
		curr_jump += 1
		velocity.y += small_jump
	if is_on_floor():
		curr_jump = 0

func walljump():
	if not is_on_wall_only(): return

	var wall_normal = get_wall_normal()

	if Input.is_action_just_pressed("jump") and wall_normal == Vector2.LEFT:
		velocity.x = wall_normal.x * wall_jump_x
		velocity.y = wall_jump_y

	if Input.is_action_just_pressed("jump") and wall_normal == Vector2.RIGHT:
		velocity.x = wall_normal.x * wall_jump_x
		velocity.y = wall_jump_y

func dash_ativation(put,delta):
	if Input.is_action_just_pressed("dash") and put and not is_dashing and dash_time <= 0:
		is_dashing = true
		dash_start_positiong = position.x
		dash_direction = put
		dash_time = dash_cooldown


	if is_dashing:
		var current_distance = abs(position.x - dash_start_positiong)
		if current_distance >= dash_max_distiance or is_on_wall():
			is_dashing = false
		else:
			velocity.x = dash_direction * dash_speed * dash_curve.sample(current_distance / dash_max_distiance)
			velocity.y = 0
	if dash_time > 0:
		dash_time -= delta

func _on_hazard_detct_area_entered(_area):
	global_position = starting
	death_count +=1
	print(death_count)
	velocity.x = 0

func animtion():
	if is_on_floor_only() and velocity.x == 0:
		anime.play("Idle")
	if is_on_floor_only() and velocity.x != 0:
		anime.play("Run")
	anime.flip_h = velocity.x <0
	if not is_on_floor() and velocity.y <= 0:
		anime.play("Jump")
	if not is_on_floor() and velocity.y >= 0:
		anime.play("Fall")
	var wall_normal = get_wall_normal()
	if not is_on_wall_only(): return
	if wall_normal == Vector2.LEFT:
		anime.play("Wall jump")
	if wall_normal == Vector2.RIGHT:
		anime.flip_h = is_on_wall()
		anime.play("Wall jump")
