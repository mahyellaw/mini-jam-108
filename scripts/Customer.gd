extends Sprite

export(Array, Texture) var customer_types

const SPEED = 50.0

var index_type = 0
var temporary_position = Vector2()

func _ready():
	randomize()
	temporary_position = Vector2(rand_range(44, 148), rand_range(32, 72))
	index_type = randi() % 2 if randf() < 0.15 else randi() % 2 + 1
	texture = customer_types[index_type]

func _process(delta):
	if System.shop_position != Vector2.ZERO and System.shop_index == index_type: 
		global_position = global_position.move_toward(System.shop_position, SPEED * delta)
		return
	else: global_position = global_position.move_toward(temporary_position, SPEED * delta)

func _on_Hitbox_area_entered(area):
	if area.owner.is_in_group("shop"):
		if System.stock <= 0:
			System.initiate_failure("stocks")
			return
		area.owner.customer_has_purchased()
		call_deferred("queue_free")
