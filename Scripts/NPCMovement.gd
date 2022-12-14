extends KinematicBody2D

onready var npcScript = get_node("CollisionShape2D")
var facingLeft = true
var npc
var animator
var speed = 400
var gravity = 3000
var velocity = Vector2()
var idle = true
var dead = false
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	npc = npcScript.Setup()
	if (npcScript.get_script() == preload("Llama.gd")):
		animator = get_node("Llamas/" + npc + "/" + npc + "/AnimationPlayer")
	else: if (npcScript.get_script() == preload("Human.gd")):
		animator = get_node("Humans/" + npc + "/AnimationPlayer")
		

func Roam(_delta):
	idle = false
	
	var direction = rng.randi_range(0, 1)
	var walktime = rng.randf_range(0.5, 2.5)
	var idletime = rng.randf_range(1, 3)
	
	#left
	if (direction == 0):
		animator.play("Walk")
		velocity.x = -speed
		if (!facingLeft):
			facingLeft = true
			self.scale.x = -self.scale.x
	#right
	else:
		animator.play("Walk")
		velocity.x = speed
		if (facingLeft):
			facingLeft = false
			self.scale.x = -self.scale.x
		
	yield(get_tree().create_timer(walktime), "timeout")
	
	velocity.x = 0
	animator.play("RESET")
	yield(get_tree().create_timer(idletime), "timeout")
	idle = true
	pass

func _physics_process(delta):
	if(!dead):
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity, Vector2.UP)
		if(idle):
			Roam(delta)
