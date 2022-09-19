extends KinematicBody2D

onready var sprite = get_node("Sprite")
onready var explosion = get_node("Explosion")
var dead : bool = false

func die():
	dead = true
	sprite.visible = false
	explosion.visible = true
	yield(get_tree().create_timer(0.8), "timeout")
	queue_free()
