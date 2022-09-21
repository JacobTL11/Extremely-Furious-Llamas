extends KinematicBody2D

#onready var animator = get_node("AnimationPlayer")
var speed = 600
var velocity = Vector2()
var idle = true
var dead = false
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func Roam(_delta):
	idle = false
	
	var direction = rng.randf_range(-1, 1)
	var walktime = rng.randf_range(0.5, 2.5)
	var idletime = rng.randf_range(1, 3)
	
	if (direction <= 0):
		#animator.play("Walk")
		velocity.x = -speed
		if (self.scale.x == 1):
			self.scale.x = -1
	else:
		#animator.play("Walk")
		velocity.x = speed
		if (self.scale.x == -1):
			self.scale.x = 1
	
	#if(idle):
		#animator.play("Idle")
		
	yield(get_tree().create_timer(walktime), "timeout")
	
	velocity.x = 0
	yield(get_tree().create_timer(idletime), "timeout")
	idle = true
	pass

func _physics_process(delta):
	if(!dead):
		velocity = move_and_slide(velocity, Vector2.UP)
		if(idle):
			Roam(delta)
