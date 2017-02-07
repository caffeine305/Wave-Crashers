extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var spritePart;
var nPart;
var vel;
var scale;
var lerpVel;
var opac;
var lerpOpac;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	spritePart = load("res://imgs/ola.png");
	nPart = 150;
	vel = 500;
	scale = 0.1;
	lerpVel = 0.0005;
	opac = 1;
	lerpOpac = 0.0005;
	for i in range(nPart):
		var part = Sprite.new();
		add_child(part);
		part.set_texture(spritePart);
		var angle = i * 2*PI/nPart;
		part.rotate(angle);
		part.scale(scale * Vector2(1,1));
	set_fixed_process(true);

func _fixed_process(delta):
	for part in get_children():
		vel = lerp(vel,0,lerpVel);
		var error = randf();
		part.move_local_y(-delta * vel * error);
		part.set_opacity(opac);
		opac = lerp(opac,0,lerpOpac);
		if opac < 0.05:
			queue_free();
