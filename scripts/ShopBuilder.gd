extends ShopBlueprint

export var shop_tscn : PackedScene
export(Array, Texture) var shop_types

var shop_index = 0

# warning-ignore:standalone_ternary
func build_mode(enabled):
	show() if enabled else hide()
	shop_index = 0

func _process(_delta):
	follow_mouse(get_global_mouse_position())

func _unhandled_input(_event):
	shop_index += int(Input.is_mouse_button_pressed(5)) - int(Input.is_mouse_button_pressed(4))
	shop_index = clamp(shop_index, -1, 3)
	if shop_index == 3: shop_index = 0
	if shop_index == -1: shop_index = 2
	
	texture = select_shop_type(shop_types, shop_index)
	
	if Input.is_action_just_pressed("build") and is_visible_in_tree():
		build_shop(shop_tscn, texture, global_position, get_parent())
		build_mode(false)
