extends Area2D

func _physics_process(_delta):
	for body in get_overlapping_bodies():
		var collision = body.get_node("CollisionShape2D")
		if (collision != null):
			if body.get_node("CollisionShape2D").has_method("HumanDie") || body.get_node("CollisionShape2D").has_method("LlamaDie"):
				if body.get_node("CollisionShape2D").has_method("HumanDie"):
					body.get_node("CollisionShape2D").HumanDie()
					Collectables.pickup_human_meat()
				if body.get_node("CollisionShape2D").has_method("LlamaDie"):
					body.get_node("CollisionShape2D").LlamaDie()
					Collectables.pickup_llama_meat()
