extends Node

var collected_ingredients = []
var collected_human_meat = 0
var collected_llama_meat = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func pickup_ingredient(name):
	Collectables.collected_ingredients.append(name)
func pickup_human_meat():
	Collectables.collected_human_meat += 1
func pickup_llama_meat():
	Collectables.collected_llama_meat += 1


