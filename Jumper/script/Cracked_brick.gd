extends StaticBody2D
var dir = Vector2(0,0)

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	# sets collision for entity colliding at the top
	#Allow player-entity to go through from below
	set_one_way_collision_direction(Vector2(0,1))
	pass

func exit_screen():
	queue_free() #remove platform once out of view
	pass # replace with function body
