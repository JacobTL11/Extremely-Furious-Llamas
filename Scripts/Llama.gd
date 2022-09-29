extends CollisionShape2D

onready var llama = get_node("../Llamas/Allex")
onready var explosion = get_node("../Explosion")
onready var StabPlayer = get_node("../Stab")
onready var ScreamPlayer = get_node("../Scream")
onready var BGMplayer = get_node("../../../BackgroundMusic")
var dead : bool = false
var rng = RandomNumberGenerator.new()

func Setup():
	llama.visible = false
	rng.randomize()
	var llamacount = rng.randi_range(1,5)
	if (llamacount == 1):
		llama = get_node("../Llamas/Allex")
	else: if (llamacount == 2):
		llama = get_node("../Llamas/Bob")
	else: if (llamacount == 3):
		llama = get_node("../Llamas/Vellma")
	else: if (llamacount == 4):
		llama = get_node("../Llamas/Lliam")
	else: if (llamacount == 5):
		llama = get_node("../Llamas/Marshall")
	llama.visible = true
	return llama.name

func die():
	if (!dead):
		dead = true
		llama.visible = false
		explosion.visible = true
		StabPlayer.pitch_scale = rng.randf_range(2,4)
		BGMplayer.pause_for_horror()
		self.disabled = true
		self.visible = false
		StabPlayer.play()
		ScreamPlayer.play(0.63)
		get_node("../").dead = true
		yield(get_tree().create_timer(1), "timeout")
		get_node("../").queue_free()
