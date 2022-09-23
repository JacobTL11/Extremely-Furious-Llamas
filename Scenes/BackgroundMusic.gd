extends AudioStreamPlayer2D

func pause_for_horror():
	self.stop()
	self.volume_db = -30
	yield(get_tree().create_timer(1.5), "timeout")
	self.play()
	while(self.volume_db < 0):
		self.volume_db += 1
		yield(get_tree().create_timer(0.1), "timeout")
