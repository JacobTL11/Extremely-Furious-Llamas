extends Area2D
onready var effect = get_parent().get_node("PickupSound")
func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body.name == "Player":
			Collectables.pickup_ingredient(self.get_parent().name)
			#print(get_parent().get_parent().get_node("PickupSound").name)
			
			
			effect.play()
			#print(effect.is_playing())
			#print(effect.name)
			
			self.get_parent().visible = false
			yield(get_tree().create_timer(5), "timeout")
			
# Called when the node enters the scene tree for the first time.
func _ready():
	var effect = get_parent().get_node("PickupSound")
	#effect.play() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
