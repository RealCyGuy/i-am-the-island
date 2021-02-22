extends Node

const ENEMY = preload("res://Enemy/Enemy.tscn")

func spawn():
	var rand = randf()
	var location = Vector2()
	if rand < 0.25:
		location.x = 0
		location.y = rand_range(0, 192)
	elif rand < 0.5: 
		location.x = 256
		location.y = rand_range(0, 192)
	elif rand < 0.75:
		location.y = 0
		location.x = rand_range(0, 256)
	else:
		location.y = 192
		location.x = rand_range(0, 256)
	var enemy = ENEMY.instance()
	get_parent().add_child(enemy)
	enemy.global_position = location
	enemy.update_directon()

func _on_Spawn_timeout():
	if !Global.end:
		spawn()

func _on_RampUp_timeout():
	$Spawn.wait_time -= 0.1

func _on_RampUpStart_timeout():
	$RampUp.start()
	$Spawn.wait_time = 2
