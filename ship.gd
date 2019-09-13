extends RigidBody2D

# Declare member variables here. Examples:
onready var world = get_node("/root/world")


# Called when the node enters the scene tree for the first time.
func _ready():
	var w = world.width
	var h = world.height
	position.x = w/2
	position.y = h/2

func _integrate_forces(state):
	
	var w = world.width
	var h = world.height
		
#	position.x = fmod(position.x, w)
#	position.y = fmod(position.y, h)
	
#	if position.x < 0:
#		position.x = position.x + w
	
#	if position.y < 0:
#		position.y = position.y + h

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var world  =get_node("/root/world")
	var w = world.width
	var h = world.height	
	var X = position.x/w as float
	var Y = position.x/h as float
	
	
	var wind = 20*world.windField(X,Y)
	
	var dragCoeff = 200
	
	var windForce = dragCoeff*(wind - linear_velocity)
	
	#var quadDrag = -0.03 * linear_velocity
	
	var windString = "%10.4f,%10.4f" % [windForce.x, windForce.y]
	
	get_node("/root/world/Label").set_text(windString)
	
	add_central_force(windForce)
	#add_central_force(quadDrag)
	
	if Input.is_action_pressed("ui_right"):
    # move as long as the key/button is pressed
    	add_torque(0.1)
	