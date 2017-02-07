extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var lives;
var spriteBroken;
var children;
var sceneEnd;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	lives = get_child_count();
	children = get_children();
	spriteBroken = load("res://imgs/hundido.png");
	sceneEnd = load("res://scenes/end.tscn");
	
func less_life():
	children[lives-1].set_texture(spriteBroken);
	children[lives-1].set_scale(0.2 * Vector2(1,1));
	lives -= 1;
	print("vidas: ",lives);
	if(lives == 0):
		end_game();

func end_game():
	var score = get_node("../score/Area2D").salvados;
	get_node("..").set_fixed_process(false);
	for n in get_node("..").get_children():
		print(n.get_name());
		if n.is_in_group("barco") or n.get_name() == "score" or n.get_name() == "mouse":
			n.queue_free();
	var end = sceneEnd.instance();
	get_node("..").add_child(end);
	end.draw_score(score);
	queue_free();