extends RigidBody2D
export (NodePath) var camera_path
var world = 'res://scene/world.tscn'
var camera
var height
var raycast_down 
var sprite
export var speed = 300
export var jspeed = 400

#MOVEMENT DIRECTIONS
var Left = Input.is_action_pressed("Left")
var Right = Input.is_action_pressed("Right")
var Jump = Input.is_action_pressed("Jump")

func _ready():
	set_fixed_process(true)
	sprite = get_node("Sprite")
	raycast_down = get_node("RayCast2D_down")
	raycast_down.add_exception(self)
	camera = get_node(camera_path)
	height = get_viewport().get_rect().size.y
	pass
	
func grounded(): #to test if player is toching ground
	if raycast_down.is_colliding():return true
	else:return false
	pass
	
func _fixed_process(delta):
	set_linear_velocity(Vector2(0,get_linear_velocity().y)) #reads in gravity/prevents player from contnious movement
	Left = Input.is_action_pressed("Left")
	Right = Input.is_action_pressed("Right")
	Jump = Input.is_action_pressed("Jump")
	
	if Left: #get_linear_velocity gets gravity info and inputs it into movement
		set_linear_velocity(Vector2(-speed,get_linear_velocity().y)) 
		sprite.set_flip_h(false) #flip to left
	elif Right:
		set_linear_velocity(Vector2(speed,get_linear_velocity().y))
		sprite.set_flip_h(true) #If true flip to right
	pass
	if grounded() == true && Jump:
		set_linear_velocity(Vector2(get_linear_velocity().x,-jspeed))
	pass
	
func exit_screen():
	if get_pos().y > camera.get_pos().y + height/2:
		get_tree().change_scene(world)
		print("lose")
	if get_pos().x > camera.get_pos().x and get_linear_velocity().x > 0:#RIGHT SIDE OF VIEWPORT
		set_pos(Vector2(0,get_pos().y))
	if get_pos().x < camera.get_pos().x and get_linear_velocity().x < 0:#LEFT SIDE OF VIEWPORT
		set_pos(Vector2(1024,get_pos().y))
	pass # replace with function body
