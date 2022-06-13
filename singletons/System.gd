extends Node

var win_status = "failed_stocks"

var mobile_mode = true
var shop_position = Vector2()
var shop_index = 0

var total_revenue = 10.0
var currency = 10.0
var stock = 150

func instantiate_object(tscn, position, parent):
	var instance = tscn.instance()
	instance.global_position = position
	parent.add_child(instance)

func used_stocks(stocks_amount):
	currency += 1
	stock -= stocks_amount
	total_revenue += 1 + stocks_amount
	print(total_revenue)

# warning-ignore:return_value_discarded
func initiate_failure(failure_type):
	if failure_type == "currency":
		win_status = "failed_currency"
	if failure_type == "stocks":
		win_status = "failed_stocks"
	get_tree().change_scene("res://scenes/Screen.tscn")
