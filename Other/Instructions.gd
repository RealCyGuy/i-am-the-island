extends Label

var clicks_remaining = 1

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if clicks_remaining == 0:
				visible = false
			else:
				clicks_remaining -= 1
