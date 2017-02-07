extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var scoreLabel;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	scoreLabel = get_node("score");

func draw_score(score):
	scoreLabel.set_text(str(score));