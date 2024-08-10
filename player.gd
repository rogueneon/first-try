extends CharacterBody2D
var speed = 250
var gravity = 1000
var jump = 300
var aceel = 12500
var air_aceel = 1800
var friction = 1500
var air_friction = 1
var dashed = 500
var max_dash = 1
var dash_count = 0

@onready var dash_timer = %"Dash timer"
@onready var anime = %AnimatedSprite2D
@onready var coyote = %coyote
@onready var starting = global_position


func _physics_process(delta):
	
	#move(put,delta)
	
	
	grav(delta)
	walljump(delta)
	Jump()
	var put = Input.get_axis("left", "right")
	accl(put,delta)
	frict(put,delta)
	air_accl(put,delta)
	air_frict(delta)
	var was = is_on_floor()
	move_and_slide()
	var just_left = was and not is_on_floor() and velocity.y >= 0
	if just_left:
		coyote.start()
	
	
	dash(delta)


func accl(put,delta):
	if not is_on_floor(): return
	if put != 0:
		velocity.x = move_toward(velocity.x, speed * put, aceel * delta)
		print(velocity.x)
		anime.flip_h = put <0
		anime.play("Run")
		
	


func frict(put,delta):
	if not is_on_floor(): return
	if put == 0:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		
		anime.play("Idle")
	
	


func grav(delta):
	if is_on_floor(): return
	velocity.y += gravity * delta
	if velocity.y < 0:
		anime.flip_h = velocity.x <0
		anime.play("Jump")
	else:
		anime.play("Fall")


func Jump():
	if is_on_floor() or coyote.time_left > 0.0:
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jump

func air_accl(put,delta):
	if is_on_floor(): return
	if put != 0:
		velocity.x = move_toward(velocity.x,speed * put, air_aceel * delta)
		#print(velocity.x)


func air_frict(delta):
	if is_on_floor(): return
	velocity.x = move_toward(velocity.x,0,10)
	#print(velocity.x)


func walljump(delta):
	if not is_on_wall_only(): return
	var wall_normal = get_wall_normal()
	if Input.is_action_just_pressed("jump") and wall_normal == Vector2.LEFT:
		#if Input.is_action_just_pressed("jump"):
		velocity.x = wall_normal.x * jump
		velocity.y = -jump
		print(velocity.x)
	if wall_normal == Vector2.LEFT:
		anime.play("Wall jump")
	if Input.is_action_just_pressed("jump") and wall_normal == Vector2.RIGHT:
		#if Input.is_action_just_pressed("jump"):
		velocity.x = wall_normal.x * jump
		velocity.y = -jump
		print(velocity.x)
	if wall_normal == Vector2.RIGHT:
		anime.flip_h = is_on_wall_only()
		anime.play("Wall jump")
		

func dash(delta):
	if Input.is_action_just_pressed("dash") and Input.is_action_pressed("right"):
		friction = 0
		gravity = 0
		dash_count += 1
		speed = dashed
		if not dash_count > max_dash:
			velocity.x = dashed
			velocity.y = 0
			dash_timer.start()
			print(dash_count)
			anime.play("Hit")
		
	if is_on_floor():
		friction = 1000
		dash_count = 0
	
	if dash_timer.is_stopped():
		gravity = 800
		speed = 250
		
	if Input.is_action_just_pressed("dash") and Input.is_action_pressed("left"):
		friction = 0
		gravity = 0
		dash_count += 1
		speed = dashed
		if not dash_count > max_dash:
			velocity.x = -dashed
			velocity.y = 0
			dash_timer.start()
			print(dash_count)
			anime.play("Hit")
		
	if is_on_floor():
		friction = 1000
		dash_count = 0
	
	if dash_timer.is_stopped():
		gravity = 800
		speed = 250


func _on_hazard_detct_area_entered(area):
	global_position = starting
	
