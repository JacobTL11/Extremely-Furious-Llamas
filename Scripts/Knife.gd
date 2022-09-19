extends Area2D

func _physics_process(_delta):
	for body in get_overlapping_bodies():
		if body.has_method("die"):
			body.die()
