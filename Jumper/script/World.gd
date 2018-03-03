extends Node2D

var cracked = preload('res://scene/Cracked_brick.tscn')

func _ready():
	randomize()
	var y =0
	while y > -10000:
		var new_cracked = cracked.instance()
		new_cracked.set_pos(Vector2(rand_range(60,960),y))
		add_child(new_cracked)
		y -= rand_range(10,210)
	pass 
