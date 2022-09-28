extends Area2D

func _physics_process(_delta):
	for body in get_overlapping_bodies():
		if body.get_name() == "Human" || body.get_name() == "Llama" :
			body.get_node("CollisionShape2D").die()
			if body.get_name() == "Human":
				self.get_parent().get_parent().pickup_human_meat()
			if body.get_name() == "Llama":
				self.get_parent().get_parent().pickup_llama_meat()
