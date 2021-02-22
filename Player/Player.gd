extends Area2D

const BULLET = preload("res://Bullet/Bullet.tscn")
var mouse

func _process(delta):
	mouse = get_viewport().get_mouse_position()
	if mouse.x < 128:
		if mouse.y < 96:
			$AnimatedSprite.frame = 3
		else:
			$AnimatedSprite.frame = 2
	else:
		if mouse.y < 96:
			$AnimatedSprite.frame = 0
		else:
			$AnimatedSprite.frame = 1
			
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if (event.position != position):
				var direction = (get_global_mouse_position() - global_position).normalized()
				var bullet = BULLET.instance()
				get_parent().add_child(bullet)
				bullet.global_position = global_position
				bullet.set_ball_direction(direction)

func _on_Player_area_entered(area):
	if "Enemy" in area.name:
		Global.end = true
