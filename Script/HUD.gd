extends Control
var score = 0
var Deaths = 0
@onready var totalmelons: Label = %Label
@onready var TotalDeaths: Label = %Label2



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Deaths = Player.Total_deaths
	score = Melons.totalmelons
	totalmelons.text = "Melons %d" % score
	TotalDeaths.text = "Deaths %d" % Deaths
	
	


