extends KinematicBody2D

onready var Charlles = get_node("Charlles")
onready var animator = get_node("Charlles/AnimationPlayer")
var speed = 600
var jump_speed = 500
var gravity = 1000
var velocity = Vector2()

func _ready():
	animator.play("Idle")
	pass

func get_input(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		if (Charlles.scale.x == 1):
			Charlles.scale.x = -1
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		if (Charlles.scale.x == -1):
			Charlles.scale.x = 1
	if Input.is_action_pressed("jump"):
		if (is_on_floor()):
			velocity.y -= jump_speed

	#gravity
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	pass

func _physics_process(delta):
	get_input(delta)
