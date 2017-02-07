extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var enemigos;
var labelEnem;
var textEnem;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	enemigos = 0;
	textEnem = "Enemigos derrotados: ";
	labelEnem = get_node("enemigos");
	labelEnem.set_text(textEnem+str(enemigos));

func add_enemy():
	enemigos += 1;
	labelEnem.set_text(textEnem+str(enemigos));