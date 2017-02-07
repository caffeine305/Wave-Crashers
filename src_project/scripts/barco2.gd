extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var sprite;

var speed;
var dir;
var lerpDir;
var lerpRot;
var lerpOpac;
var front;
var scale;

var expSprite;
var sceneExp;
var explotando;
var expLife;
var expTime;
var opac;
var lives;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	sprite = get_node("Sprite");
	
	speed = 120;
	dir = Vector2(-1,0);
	lerpDir = 0.01;
	lerpRot = 0.01;
	opac = 1;
	front = -PI/2;
	scale = 0.5;
	
	sceneExp = load("res://scenes/explosion.tscn");
	expSprite = load("res://imgs/hundido.png");
	explotando = false;
	expLife = 3;
	expTime = 0;
	lerpOpac = 0.03;
	lives = get_node("../lives");
	print(lives);
	
	set_fixed_process(true);

func _fixed_process(delta):
	movimiento();
	exterior();
	# colision del barco
	var cols = get_colliding_bodies();
	for col in cols:
		if(col.is_in_group("obstaculo")):
			colision();
			
	if(explotando):
		explotar(delta);
		
func movimiento():
	var vel = get_linear_velocity();
	var rot = get_rot();
#	print(rot,"   ",front);
	rot = lerp(rot,front,lerpRot);
#	print(rot);
	vel.x = lerp(vel.x,speed * dir.x,lerpDir);
	vel.y = lerp(vel.y,speed * dir.y,lerpDir);
	set_linear_velocity(vel);
	set_rot(rot);
	set_scale(scale * Vector2(1,1));
	get_node("collider").set_scale(scale * Vector2(1,1));
#	get_node("escudo").set_scale(scale * Vector2(1,1));

func colision():
	# instancío la explosión
	if(!explotando):
		var expl = sceneExp.instance();
		sprite.add_child(expl);
		expl.set_scale(5*Vector2(1,1))
		expl.set_pos(Vector2(0,0))
		# cambio el sprite
		sprite.set_texture(expSprite);
		sprite.set_scale(scale * Vector2(1,1));	
		explotando = true;
		if(lives != null):
			lives.less_life();

func explotar(delta):
	opac = lerp(opac,0,lerpOpac);
	set_opacity(opac);
	expTime += delta;
	if(expTime >= expLife):
		print("muerte");
		queue_free();
		
func exterior():
	var pos = get_pos()
	var vp = get_viewport_rect().size;
	if(pos.y <= -50 or pos.y >= vp.y + 50):
		print(pos,"   ",vp);
		print("bye");
		queue_free();