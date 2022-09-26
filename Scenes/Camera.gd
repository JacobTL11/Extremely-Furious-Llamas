extends Camera2D

onready var player = get_node("../Player")

func _process(delta):
	self.position.x = player.position.x
