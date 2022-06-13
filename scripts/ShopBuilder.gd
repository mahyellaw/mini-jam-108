extends BuilderHelper

export var shop_tscn : PackedScene
export(Array, Texture) var shop_types

var shop_index = 0

# warning-ignore:standalone_ternary
func build_mode(enabled):
	$destroy.play()
	show() if enabled else hide()

## MOBILE FEATURE ##
#func match_selected_blueprint(selected_index):
#	shop_index = selected_index

func _process(_delta):
	follow_mouse(get_global_mouse_position())
#	if !System.mobile_mode:
#		follow_mouse(get_global_mouse_position())

func _unhandled_input(_event):
	shop_index += int(Input.is_mouse_button_pressed(5)) - int(Input.is_mouse_button_pressed(4))
	shop_index = clamp(shop_index, -1, 3)
	if shop_index == 3: shop_index = 0
	if shop_index == -1: shop_index = 2
	
	texture = select_shop_type(shop_types, shop_index)
	$Hotbar.indicate_selected_blueprint(shop_index)
#	if !System.mobile_mode:
#		$Hotbar.indicate_selected_blueprint(shop_index)
	
#	if event is InputEventScreenTouch and event.is_pressed():
#		follow_mouse(event.position)
	
	if Input.is_action_just_pressed("left_click") and is_visible_in_tree():
		$build.play()
		build_shop(shop_tscn, shop_index, texture, global_position, get_parent())
		get_tree().call_group("debris", "emit_particles", "build", global_position)
		get_tree().call_group("camera", "shake", 2)
		build_mode(false)
