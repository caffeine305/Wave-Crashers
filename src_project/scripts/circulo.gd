extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var scene_ola;
var nOlas;
var olas;
var vel;
var scale;
var maxDist;
var lerpVal;
var opac;
var lerpOpac;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	scene_ola = load("res://scenes/ola.tscn");
	nOlas = 12;
	vel = 120;
	scale = 0.8;
	maxDist = 10;
	lerpVal = 0.0005;
	opac = 1;
	lerpOpac = 0.005;
	for i in range(nOlas):
		var ola = scene_ola.instance();
		add_child(ola);
		var angle = i * 2*PI/nOlas;
		var dir = Vector2(cos(angle),sin(angle));
#		print(angle,get_pos(),ola)
		ola.rotate(angle);
		ola.scale(scale * Vector2(1,1));
		ola.dir = dir;
	set_fixed_process(true);

func _fixed_process(delta):
	for ola in get_children():
		vel = lerp(vel,0,lerpVal);
		ola.move_local_y(-delta * vel);
#		ola.get_node("body").move(vel * ola.dir);
		ola.set_opacity(opac);
		if vel < 60:
			opac = lerp(opac,0,lerpOpac);
		if opac < 0.05:
			queue_free();
