extends TextureRect

# warning-ignore:return_value_discarded
func _on_Play_pressed():
	get_tree().change_scene("res://scenes/World.tscn")
