extends Node2D

export var customer_tscn : PackedScene

var multiplier = 1.50

func _on_Cooldown_timeout():
	randomize()
	var customer_amount = randi() % 8 + 5
	customer_amount += customer_amount * multiplier
	
	for _i in range(customer_amount):
		System.instantiate_object(customer_tscn, get_children()[randi() % 3].global_position, get_parent())
	multiplier -= 0.05
	$Cooldown.start(randi() % 3 + 2)
