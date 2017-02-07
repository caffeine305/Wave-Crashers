extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var edo;
const OLAS = 1;
const ROCAS = 3;
const FIN = 10;

var text_olas;
var text_rocas;
var text_gl;

var sceneBoat;
var sceneRock;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	edo = 1;
	text_olas = get_node("text_olas");
	text_rocas = get_node("text_rocas");
	text_gl = get_node("text_gl");
	
	sceneBoat = load("res://scenes/barco.tscn");
	sceneRock = load("res://scenes/roca1.tscn");
	
	set_process_input(true);
	set_fixed_process(true);
	
func _input(ev):
	if(ev.type == InputEvent.MOUSE_BUTTON and ev.pressed):
		if(edo == OLAS):
			to_rocas();
			
func _fixed_process(delta):
	if(edo == ROCAS):
		var ships = false
		var hijos = get_children();
		for h in hijos:
			if h.is_in_group("barco"):
				ships = true
				break;
		if(!ships):
			load_game();

func to_rocas():
	text_olas.set_hidden(true);
	text_rocas.set_hidden(false);
	text_gl.set_hidden(false);
	var b1 = sceneBoat.instance();
	var b2 = sceneBoat.instance();
	var r1 = sceneRock.instance();
	add_child(b1);
	add_child(b2);
	add_child(r1);
	b1.set_pos(Vector2(800,200));
	b2.set_pos(Vector2(900,300));
	r1.set_pos(Vector2(400,250));
	r1.set_scale(0.5 * Vector2(1,1));
	edo = ROCAS;
	
func load_game():
	get_tree().change_scene("res://scenes/spawner.tscn")