extends Node2D

var ticks = 0
var randomInt = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$UI.change(1, 5)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if ticks == 8:
		randomInt = NewIntegerGenerator(1,5,randomInt)
		var newFont = load("res://UI/fonts/font"+str(randomInt)+".png")
		$Label.add_theme_font_override("font", newFont)
		ticks = 0
	else: ticks += 1

func NewIntegerGenerator(start:int, end:int, current:int):
	var rng = RandomNumberGenerator.new()
	var new = rng.randi_range(start,end)
	while(new == current):
		new = rng.randi_range(start,end)
	return new
