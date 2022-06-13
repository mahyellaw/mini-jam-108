class_name BuilderHelper
extends Sprite

func follow_mouse(mouse_position):
	if global_position.distance_to(mouse_position) > 4.0:
		global_position = mouse_position
		global_position.x = clamp(global_position.x, 44, 148)
		global_position.y = clamp(global_position.y, 32, 72)

static func select_shop_type(texture_arr, shop_index):
	return texture_arr[shop_index]

static func build_shop(scene, shop_index, shop_texture, target_position, parent):
	var shop = scene.instance()
	shop.index_type = shop_index
	shop.texture = shop_texture
	shop.global_position = target_position
	parent.add_child(shop)
