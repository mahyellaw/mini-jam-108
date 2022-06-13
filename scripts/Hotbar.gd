extends Node

func indicate_selected_blueprint(shop_index):
	$Selector.global_position = get_children()[shop_index].global_position
#	if System.mobile_mode:
#		get_tree().call_group("builder", "match_selected_blueprint", shop_index)

func _on_RefHB_input_event(_viewport, _event, _shape_idx):
	pass # if event.is_action_pressed("left_click"): indicate_selected_blueprint(0)
func _on_HotHB_input_event(_viewport, _event, _shape_idx):
	pass # if event.is_action_pressed("left_click"): indicate_selected_blueprint(1)
func _on_IceHB_input_event(_viewport, _event, _shape_idx):
	pass # if event.is_action_pressed("left_click"): indicate_selected_blueprint(2)
