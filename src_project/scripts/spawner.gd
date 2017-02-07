extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var sceneBarcos;
var sceneMouse;
var scale;
var aux = -1.0;
var t = 0
var spawnTime = 150;
var minSpawnTime = 100;
var spawnSpeed = 5;

func _ready():
	sceneMouse = load("res://scenes/mouse.tscn");
	var mouse = sceneMouse.instance();
	add_child(mouse);
	# Called every time the node is added to the scene.
	# Initialization here
	sceneBarcos = load("res://scenes/barco.tscn");
	
	scale = 1.2;
	set_fixed_process(true);

func _fixed_process(delta):
		t -= 1
		if(t<=0):
			t = spawnTime;
			var  y_size = get_viewport().get_rect().size.y;
			var x_size = get_viewport().get_rect().size.x;
			var y_sizeInt = int (y_size) - 200
			var RandomNumbery= randi()%y_sizeInt + 100
			while ((aux<RandomNumbery+100) and (aux > RandomNumbery-100)):
				RandomNumbery= randi()%y_sizeInt + 100
			var pos = Vector2 (x_size + 150 ,RandomNumbery)
			var space = get_world_2d().get_direct_space_state();
			var barco = sceneBarcos.instance();
			add_child(barco);
			barco.set_pos(pos);
			barco.set_scale(scale * Vector2(1,1));
			barco.set_rot(-90*PI/180)
			aux = RandomNumbery
			if(spawnTime > minSpawnTime):
				spawnTime -= spawnSpeed;