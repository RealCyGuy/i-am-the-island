extends Node

var end = false

func load_level():
	end = false
	get_tree().change_scene("res://Level.tscn")
