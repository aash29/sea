extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	world
	
	var U = -1 - X^2 + Y
	var V =  1 + X - X*Y^2
	add_central_force(Vector2(	
	
#	pass
