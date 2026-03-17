extends CanvasLayer

@onready var colourInversion: Panel = $ColourInversion

var alpha_value := 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	colourInversion.material.set_shader_parameter("alpha", alpha_value)

func change(newValue: float, secs: float):
	var tween = create_tween()
	tween.tween_property($".", "alpha_value", newValue, secs)
	
	
	
