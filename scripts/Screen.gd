extends TextureRect

export(Array, Texture) var screens

func _ready():
	match System.win_status:
		"success":
			texture = screens[1]
			$Label.text = "Yay! Time to call it a day.\nThanks for playing~ :D"
			$success.play()
		"failed":
			texture = screens[1]
			$Label.text = "You failed?\nYou disgust me."
			$Label.modulate = Color.red
			$fail.play()
		"failed_currency":
			$logo.hide()
			$Button.show()
			texture = screens[0]
			$Label.text = "Not enough capital to build.\nHere's a budget end screen. :P"
			$fail.play()
		"failed_stocks":
			$logo.hide()
			$Button.show()
			texture = screens[0]
			$Label.text = "Not enough stocks to sell.\nHere's a budget end screen, too. :P"
			$fail.play()

# warning-ignore:return_value_discarded
func _on_Button_pressed():
	System.currency = 10.0
	System.stock = 150
	get_tree().change_scene("res://scenes/World.tscn")
