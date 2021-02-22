extends Area2D

var health = 3
var velocity = Vector2()

func _physics_process(delta):
	if !Global.end:
		position += (velocity * delta)

func _on_Enemy_area_entered(area):
	if area.name == "BulletArea":
		health -= 1
		$AnimatedSprite.frame = health - 1
		$AnimationPlayer.play("flash")
		if health == 0:
			queue_free()
			
func update_directon():
	velocity = (get_parent().get_node("Player").global_position - global_position).normalized() * 20
