extends Camera2D

export(NodePath) var player_path
var player

func _ready():
	set_fixed_process(true)
	player = get_node(player_path)
	#assign camera to player
	pass
	
func _fixed_process(delta):
	var player_y =  player.get_pos().y
	if player_y < get_pos().y:
		set_pos(Vector2(0,player_y))
	pass