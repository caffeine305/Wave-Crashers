extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var sceneCirculo;
var scale;
var nOlas;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	sceneCirculo = load("res://scenes/circulo.tscn");
	scale = 0.5;
	nOlas = 2;
	set_process_input(true);

func _input(ev):
	if(ev.type == InputEvent.MOUSE_BUTTON and
		get_child_count() < nOlas and ev.pressed):
		# ver si el punto está cerca
		# de un barco
		var pos = get_viewport().get_mouse_pos();
		var space = get_world_2d().get_direct_space_state();
		var cols = space.intersect_point(pos);
		var good = true;
		for c in cols: 
			var b = c["collider"]
			if(b.is_in_group("barco")):
				good = false;
				break;
				
		if(good):
			var circ = sceneCirculo.instance();
			add_child(circ);
			circ.set_pos(pos);
			circ.set_scale(scale * Vector2(1,1));