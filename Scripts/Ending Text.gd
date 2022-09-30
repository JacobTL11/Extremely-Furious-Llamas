extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = self.text.format({"Humans": Collectables.collected_human_meat})
	self.text = self.text.format({"Llamas": Collectables.collected_llama_meat})
	self.text = self.text.format({"Ingredients": Collectables.collected_ingredients})
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
