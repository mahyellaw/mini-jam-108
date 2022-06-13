extends Sprite

export(Array, Texture) var counter_particles

var index_type = 0

func customer_has_purchased():
	$Counter.texture = counter_particles[1]
	$purchased.play()
	$Counter.restart()
	System.used_stocks(2 if randf() < 0.20 else 1)

func _ready():
	System.shop_position = global_position
	System.shop_index = index_type
	$Counter.texture = counter_particles[0]
	$Counter.restart()
	System.currency -= 1
	if System.currency < 0:
		System.initiate_failure("currency")

func _on_Hitbox_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("right_click"): # or (event is InputEventScreenTouch and event.is_pressed()):
		System.shop_position = Vector2.ZERO
		get_tree().call_group("builder", "build_mode", true)
		get_tree().call_group("debris", "emit_particles", "destroy", global_position)
		get_tree().call_group("camera", "shake", 2)
		call_deferred("queue_free")

func _on_Hitbox_mouse_entered():
	$Remove.show()
func _on_Hitbox_mouse_exited():
	$Remove.hide()
