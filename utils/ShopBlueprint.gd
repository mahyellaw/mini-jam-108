class_name ShopBlueprint
extends Sprite

func follow_mouse(mouse_position):
	if global_position.distance_to(mouse_position) > 8.0:
		global_position = mouse_position

static func select_shop_type(texture_arr, shop_index):
	return texture_arr[shop_index]

static func build_shop(scene, shop_texture, target_position, parent):
	var shop = scene.instance()
	shop.texture = shop_texture
	shop.global_position = target_position
	parent.add_child(shop)
