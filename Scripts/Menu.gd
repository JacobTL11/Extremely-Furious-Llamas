extends Node2D

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Main Level.tscn")

func _on_Quit_pressed():
	get_tree().quit()
