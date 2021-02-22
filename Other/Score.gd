extends Label

var time = 0

func _process(delta):
	if !Global.end:
		time += delta
		text = str(round(time))
