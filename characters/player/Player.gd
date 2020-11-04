extends KinematicBody2D

var score : int = 0

var speed: int = 250
var jumpForce: int = 550
var gravity : int = 1700

var vel: Vector2 = Vector2()

onready var sprite: AnimatedSprite = get_node("AnimatedSprite")

func _physics_process(delta):
	vel.x = 0
	
	# movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
	
	# applying the velocity
	vel = move_and_slide(vel, Vector2.UP)

	# gravity
	vel.y += gravity * delta
	
	# jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	
	# sprite direction
	if vel.x < 0:
		sprite.play("idle_left")
	elif vel.x > 0:
		sprite.play("idle_right")
