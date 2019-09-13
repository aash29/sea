extends Node2D

# Declare member variables here. Examples:
var width = 1024
var height = 600

func windField(X,Y):
	var U = -1 - X*X + Y
	var V =  1 + X - X*Y*Y
	return Vector2(U,V)

# Called when the node enters the scene tree for the first time.
func _ready():
	update()

func _draw():
	
	var w = width
	var h = height
	for x in range(0, width, 50):
		for y in range(0, height, 50):
			var X = x/w as float
			var Y = y/h as float
			var wind = windField(X,Y)
			var bp = Vector2(x,y);
			
			var ep = Vector2(x, y) +10*wind;
			draw_line(bp, ep, Color(255, 0, 0), 1)
			var n = Vector2(-wind.y, wind.x).normalized()
			draw_line((ep+3*n), (ep-3*n), Color(255, 0, 0), 1)
			draw_line((ep+3*n), ep+1.1*(ep-bp), Color(255, 0, 0), 1)
			draw_line((ep-3*n), ep+1.1*(ep-bp), Color(255, 0, 0), 1)
			#draw_multiline([(ep+3*n),ep+1.2*(ep-bp),(ep-3*n)],Color(255, 0, 0),1)
			

