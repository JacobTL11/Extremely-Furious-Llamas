extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body.has_method("pickup_ingredient"):
			body.pickup_ingredient(self.get_parent().name)
			self.get_parent().queue_free()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
