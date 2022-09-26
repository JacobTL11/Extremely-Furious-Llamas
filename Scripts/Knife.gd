extends Area2D

func _physics_process(_delta):
	for body in get_overlapping_bodies():
		if body.get_name() == "Human":
			body.get_node("CollisionShape2D").die()
			self.get_parent().pickup_meat()
