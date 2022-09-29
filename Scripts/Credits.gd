extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _input(ev):
	if Input.is_key_pressed(KEY_SPACE):
		get_tree().change_scene("res://Scenes/Menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
