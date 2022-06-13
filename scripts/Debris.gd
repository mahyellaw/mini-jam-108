extends CPUParticles2D

func emit_particles(input_type, target_position):
	global_position = target_position - Vector2(0, 12)
	color_ramp.colors[2] = Color("2f729e") if input_type == "build" else Color("eba254")
	restart()
