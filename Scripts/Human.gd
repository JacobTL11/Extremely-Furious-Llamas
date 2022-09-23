extends CollisionShape2D

onready var sprite = get_node("../Sprite")
onready var explosion = get_node("../Explosion")
onready var StabPlayer = get_node("../Stab")
onready var BGMplayer = get_node("../../BackgroundMusic")
var dead : bool = false
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func die():
	if (!dead):
		dead = true
		sprite.visible = false
		explosion.visible = true
		StabPlayer.pitch_scale = rng.randf_range(2,4)
		BGMplayer.pause_for_horror()
		StabPlayer.play()
		get_node("../").dead = true
		yield(get_tree().create_timer(0.8), "timeout")
		get_node("../").queue_free()
