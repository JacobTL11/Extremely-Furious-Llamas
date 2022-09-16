extends KinematicBody2D

onready var sprite = get_node("Charlles")
var speed : int = 600
var jump_speed : int = 400
var gravity : int = 1000
var velocity = Vector2()

func get_input(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		if (sprite.scale.x == 1):
			sprite.scale.x = -1
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		if (sprite.scale.x == -1):
			sprite.scale.x = 1
	if Input.is_action_pressed("jump"):
		if (is_on_floor()):
			velocity.y -= jump_speed

	#gravity
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	pass

func _physics_process(delta):
	get_input(delta)
