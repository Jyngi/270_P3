extends Node2D

const TILENODE = preload("res://Scene/TILE.tscn")
const PLAYERNODE = preload("res://Scene/player.tscn")
# WIDTH AND HEIGHT != SCREEN WIDTH/HEIGHT 
const WIDTH = 992
const HEIGHT = 992
var GRIDSIZE = Vector2.ZERO


func _ready():
	GRIDSIZE = Vector2(WIDTH/32,HEIGHT/32)
	var counter = 0
	for a in range(GRIDSIZE.x):
		for b in range(GRIDSIZE.y):
			counter += 1
			var temp = TILENODE.instance()
			temp.position = Vector2(a,b) * 32
			if counter % 2 == 0:
				temp.modulate = Color(0.1,0.1,0.1)
			else:
				temp.modulate = Color(0.05,0.05,0.05)
			add_child(temp)
	pass # Replace with function body.

func _process(delta):
	pass
