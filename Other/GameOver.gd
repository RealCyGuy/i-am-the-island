extends Node2D

func _process(delta):
	if Global.end:
		visible = true
	else:
		visible = false

func _on_Restart_pressed():
	Global.load_level()

func _on_Quit_pressed():
	get_tree().change_scene("res://Menu/Menu.tscn")
