extends KinematicBody2D

onready var Charlles = get_node("Charlles")
onready var animator = get_node("Charlles/AnimationPlayer")
var speed = 600
var jump_speed = 1000
var gravity = 3000
var velocity = Vector2()
var idle = true

func get_input(delta):
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
	idle = true
	velocity.x = 0
	if Input.is_action_pressed("move_left"):
		idle = false
		if (is_on_floor()):
			animator.play("Walk")
		velocity.x -= speed
		if (Charlles.scale.x == 1):
			Charlles.scale.x = -1
	if Input.is_action_pressed("move_right"):
		idle = false
		if (is_on_floor()):
			animator.play("Walk")
		velocity.x += speed
		if (Charlles.scale.x == -1):
			Charlles.scale.x = 1
	if Input.is_action_pressed("jump"):
		idle = false
		animator.play("Jump")
		if (is_on_floor()):
			velocity.y -= jump_speed

	#gravity
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if(idle && is_on_floor()):
		animator.play("Idle")
	pass

func _physics_process(delta):
	get_input(delta)
	
