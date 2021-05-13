extends Node2D

const TILENODE = preload("res://Scene/TILE.tscn")
var PLAYERNODE_LEFT = preload("res://Scene/player.tscn")
const PLAYERFADE = preload("res://Scene/playerFade.tscn")
const MOVEMENTRANGE = preload("res://Scene/movement_range.tscn")
const TILEHIGHLIGHT = preload("res://Scene/TILEHIGHLIGHT.tscn")
const VFX_TELEPORT = preload("res://Scene/teleport.tscn")
const LASERCONTROLLER = preload("res://Scene/laserController.tscn")
# WIDTH AND HEIGHT != SCREEN WIDTH/HEIGHT 
const WIDTH = 480
const HEIGHT = 480
var GRIDSIZE = Vector2.ZERO

var playerOBJ = null
var highlightOBJ = null
var rangeOBJ = null
var teleportOBJ = null
var laserCONT
var fadeArray = []
var VFXTimer = 0.00
var VFXArr = []
var VFXIndex = -1
var movement = false

var movementTimer = 1.00
var effectTimer = 0.00

func _ready():
	randomize()
	GRIDSIZE = Vector2(WIDTH/32,HEIGHT/32)
	var counter = 0
	for a in range(GRIDSIZE.x):
		for b in range(GRIDSIZE.y):
			counter += 1
			var temp = TILENODE.instance()
			temp.position = Vector2(a,b) * 32
			if counter % 2 == 0:
				temp.modulate = Color(1,1,1,.05)
			else:
				temp.modulate = Color(0.05,0.05,0.05,0)
			add_child(temp)
			
	highlightOBJ = TILEHIGHLIGHT.instance()
	highlightOBJ.position = Vector2(0,0)
	highlightOBJ.modulate = Color(0,1,0,.5)
	add_child(highlightOBJ)			
	rangeOBJ = MOVEMENTRANGE.instance()
	rangeOBJ.position = Vector2(9,9) *32
	add_child(rangeOBJ)
	playerOBJ = PLAYERNODE_LEFT.instance()
	playerOBJ.position = Vector2(9,9)*32
	add_child(playerOBJ)
	laserCONT = LASERCONTROLLER.instance()
	add_child(laserCONT)
	for i in range(2):
		fadeArray.append(PLAYERFADE.instance())
	for i in range(len(fadeArray)):
		fadeArray[i].position = Vector2(9,9)*32
		fadeArray[i].modulate = Color(1,1,1,0)
		add_child(fadeArray[i])
	
func _process(delta):
	Global.playerPos = playerOBJ.position
	highlightOBJ.setXY(playerOBJ.position)
	updateTimer(delta)
	if VFXArr:
		VFXTimer += delta
		
	if VFXTimer >= 1.116:
		VFXTimer = 0
		VFXIndex -= 1
		remove_child(VFXArr[0])
		VFXArr.pop_front()
		
	if movement == true and effectTimer >= .9166:
		movementTimer = 0
		playerOBJ.Teleport(VFXArr[VFXIndex].position)
		rangeOBJ.position = playerOBJ.position
		fadeArray[0].position = playerOBJ.position
		movement = false
		effectTimer = 0.00
	
func _input(event):
	if Input.is_action_just_pressed("ui_select") == true and movementTimer > .5 and movement != true:
		SpawnVFX()
		movement = true
		
func updateTimer(delta):
	if movement == true:
		effectTimer += delta
	movementTimer += delta
	
	if movementTimer >= 1.00:
		rangeOBJ.modulate = Color(0,movementTimer,0)
		fadeArray[1].position = playerOBJ.position
		for i in range(len(fadeArray)):
			fadeArray[i].modulate = Color(1,1,1,0)
	else:
		rangeOBJ.modulate = Color(1.00 - movementTimer,movementTimer,0)
		fadeArray[0].modulate = Color(0,252.00/255,0,1-movementTimer)
		fadeArray[1].modulate = Color(180.00/255,32.00/255,42.00/255,1-movementTimer*2)
		
func SpawnVFX():
	VFXArr.append(VFX_TELEPORT.instance())
	VFXIndex += 1
	VFXArr[VFXIndex].position = highlightOBJ.position
	VFXArr[VFXIndex].modulate = Color(1,1,1,1)
	add_child(VFXArr[VFXIndex])
	VFXArr[VFXIndex].play()
		

	


