extends Control

var multiplier = 0.5

func _process(_delta):
	$Currency.text = "$%02d.00" % System.currency
	$Stock.text = "%03d" % System.stock
	$Revenue.text = "Total Revenue: $%04d.0" % System.total_revenue
	
	if System.stock < 50 and System.currency > System.stock:
		$Restock.show()
		$Restock/anim.play("bob")

func _on_Restock_pressed():
	System.stock += System.currency - 1
	System.currency = 1
	$Restock.hide()
