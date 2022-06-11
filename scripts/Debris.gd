extends CPUParticles2D

func _unhandled_input(_event):
	if Input.is_action_just_pressed("build"):
		global_position = get_global_mouse_position()
		color = Color("eba254")
		restart()
	if Input.is_action_just_pressed("destroy"):
		global_position = get_global_mouse_position()
		color = Color("2f729e")
		emitting = true
