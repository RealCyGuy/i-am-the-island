extends KinematicBody2D

const SPEED = 100
var velocity = Vector2()

func _process(delta):
	if $Lifetime.is_stopped():
		$AnimationPlayer.play("fade out")
		yield($AnimationPlayer, "animation_finished")
		queue_free()

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
		
func set_ball_direction(direction):
	velocity = direction * SPEED
	
func get_closest_enemy(collider):
	var min_dist = 99999
	var min_enemy
	var enemies = get_tree().get_nodes_in_group("Enemies")
	for enemy in enemies:
		var dist = position.distance_to(enemy.position)
		if (dist < min_dist) and enemy != collider:
			min_dist = dist
			min_enemy = enemy
	return min_enemy

func _on_Area2D_area_entered(area):
	if "Enemy" in area.name:
		$Hit.play()
		var enemy = get_closest_enemy(area)
		if enemy:
			set_ball_direction((enemy.global_position - global_position).normalized())
