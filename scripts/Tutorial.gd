extends Control

var child_index = 2

func _input(_event):
	if Input.is_action_just_pressed("left_click"):
		if child_index == 7:
			hide()
			return
		
		child_index += 1
		get_children()[child_index - 1].hide()
		get_children()[child_index].show()
