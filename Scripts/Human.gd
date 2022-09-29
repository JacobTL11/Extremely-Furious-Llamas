extends CollisionShape2D

onready var human = get_node("../Humans/Human1")
onready var explosion = get_node("../Explosion")
onready var StabPlayer = get_node("../Stab")
onready var ScreamPlayer = get_node("../Scream")
onready var BGMplayer = get_node("../../../BackgroundMusic")
var dead : bool = false
var rng = RandomNumberGenerator.new()

func Setup():
	human.visible = false
	rng.randomize()
	var humancount = rng.randi_range(1,5)
	if (humancount == 1):
		human = get_node("../Humans/Human1")
	else: if (humancount == 2):
		human = get_node("../Humans/Human2")
	else: if (humancount == 3):
		human = get_node("../Humans/Human3")
	else: if (humancount == 4):
		human = get_node("../Humans/Human4")
	else: if (humancount == 5):
		human = get_node("../Humans/Human5")
	human.visible = true
	print(human)
	return human.name

func die():
	if (!dead):
		dead = true
		human.visible = false
		explosion.visible = true
		StabPlayer.pitch_scale = rng.randf_range(2,4)
		BGMplayer.pause_for_horror()
		self.disabled = true
		self.visible = false
		ScreamPlayer.play()
		StabPlayer.play()
		get_node("../").dead = true
		yield(get_tree().create_timer(1), "timeout")
		get_node("../").queue_free()
