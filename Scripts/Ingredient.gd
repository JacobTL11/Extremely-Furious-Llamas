extends Area2D

func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body.name == "Player":
			Collectables.pickup_ingredient(self.get_parent().name)
			print(get_parent().get_node("PickupSound").name)
			var effect = get_parent().get_node("PickupSound")
			effect.play()
			print(effect.name)
			#yield(get_tree().create_timer(0.5), "timeout")
			self.get_parent().queue_free()
