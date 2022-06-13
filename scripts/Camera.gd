extends Camera2D

func shake(intens):
	randomize()
	var rand_offs = Vector2(rand_range(-intens, intens), rand_range(-intens, intens))
	$twn.interpolate_property(self, "offset", offset, rand_offs, $shakeDuration.wait_time, Tween.TRANS_SINE, Tween.EASE_IN)
	$twn.start()
	$shakeDuration.start()

func reset():
	$twn.interpolate_property(self, "offset", offset, Vector2(), $shakeDuration.wait_time, Tween.TRANS_SINE, Tween.EASE_IN)
	$twn.start()

func _on_shakeDuration_timeout() -> void:
	reset()
