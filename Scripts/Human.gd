extends CollisionShape2D

onready var sprite = get_node("../Sprite")
onready var explosion = get_node("../Explosion")
var dead : bool = false

func die():
	if (!dead):
		dead = true
		sprite.visible = false
		explosion.visible = true
		get_node("../").dead = true
		yield(get_tree().create_timer(0.8), "timeout")
		get_node("../").queue_free()
