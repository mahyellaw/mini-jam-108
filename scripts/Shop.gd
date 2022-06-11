extends Sprite

func _on_Hitbox_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("destroy"):
		get_tree().call_group("builder", "build_mode", true)
		call_deferred("queue_free")
