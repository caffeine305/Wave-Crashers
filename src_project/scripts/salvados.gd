extends Area2D

var salvados = 0;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	connect("body_enter" ,self,"_on_collision_enter")
	connect("body_exit",self,"_on_collision_exit")
	get_node("../Score").connect("renamed",self,"_on_score_refresh")
	
func _on_collision_enter(col):
#	print("colision con ",col)
	if(col.is_in_group("barco")):
		salvados = salvados+1
#		print(salvados)
		get_node("../Score").set_text(str(salvados))
		
func _on_collision_exit(col):
#	print(col," salió");
	if(col.is_in_group("barco")):
		col.queue_free()

#func _on_score_refresh():
#    	set_text("salvados")