extends Area2D

func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body.name == "Player":
			Collectables.pickup_ingredient(self.get_parent().name)
			#gt audio stream and play pop sound
			self.get_parent().queue_free()
