extends Area2D

func _physics_process(delta):
	for body in get_overlapping_bodies():
		#if the player collides
		if body.name == "Player":
			#compate the 3 global vars to see which is bigger, load correct scene depending
			get_tree().change_scene("res://Scenes/Cauldron.tscn")
			var human = Collectables.collected_human_meat
			var llama = Collectables.collected_llama_meat
			var ing = len(Collectables.collected_ingredients)
			if (human > llama && human > ing):#more human
				pass
			elif (llama > human && llama > ing):#more llama
				pass
			elif (ing > human && ing > llama):#more ingreadients
				pass
			else:
				pass

