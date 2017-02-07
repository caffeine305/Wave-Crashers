extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var body;
var dir;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	body = get_node("body");
	set_fixed_process(true);

func _fixed_process(delta):
	if body.is_colliding():
		print("adf");
		var col = body.get_collider();
		if(col.is_in_group("roca")):
			queue_free();