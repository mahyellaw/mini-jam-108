extends TextureProgress

onready var canvas_modulate = get_parent().get_parent().get_node("CanvasModulate")

func _ready():
	max_value = $length.wait_time

func _process(_delta):
	value = max_value - $length.time_left
	canvas_modulate.color = canvas_modulate.color.linear_interpolate(Color("eba254"), value / 1e6)

# warning-ignore:return_value_discarded
func _on_length_timeout():
	System.win_status = "success" if System.total_revenue >= 1000.0 else "failed"
	get_tree().change_scene("res://scenes/Screen.tscn")
