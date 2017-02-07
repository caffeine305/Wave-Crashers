extends Label

func _on_collision_detect():
	
	var score = get_node("../area").salvados 
	get_node("../Score").connect("renamed",self,"_on_score_refresh")
	
func _on_score_refresh():
    	get_node("../Score").set_text(salvados)