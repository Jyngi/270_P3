extends Node2D

const TILENODE = preload("res://Scene/TILE.tscn")
const PLAYERNODE = preload("res://Scene/player.tscn")
const TILEHIGHLIGHT = preload("res://Scene/TILEHIGHLIGHT.tscn")
# WIDTH AND HEIGHT != SCREEN WIDTH/HEIGHT 
const WIDTH = 480
const HEIGHT = 480
var GRIDSIZE = Vector2.ZERO

var playerOBJ = null
var highlightOBJ = null


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
			
	playerOBJ = PLAYERNODE.instance()
	playerOBJ.position = Vector2(9,9)*32
	add_child(playerOBJ)
	highlightOBJ = TILEHIGHLIGHT.instance()
	highlightOBJ.position = Vector2(0,0)
	add_child(highlightOBJ)
	
	pass # Replace with function body.

func _process(delta):
	highlightOBJ.setXY(playerOBJ.position)
	pass
