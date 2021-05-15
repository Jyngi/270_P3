extends Sprite

#laser spawn, laser initial, burst, dissipate
const LASERLINES = preload("res://Scene/laserWarn.tscn")
const LASER = preload("res://Scene/laser.tscn")

var warnLines = null
var laserBody = null
var laserStateArray = [false,false,false,false]
var laserStartPos = null
var laserXYPos = [Vector2.ZERO,Vector2.ZERO]
var destroy = false
var vert = 0
var direct = randi()%2
var directionalArr = [-1,1]
var st3R1 = false
var st2R1 = false
# if true vert, if false horizon

func _ready():
	laserStartPos = floor(rand_range(0,480)/32)
	vert = randi()%2
	if vert == 0:
		# Vertical Lines
		laserXYPos[0] = Vector2(laserStartPos*32 + 16,0)
		laserXYPos[1] = Vector2(laserStartPos*32 + 16,480)
	if vert == 1:
		# Horizontal Lines
		laserXYPos[0] = Vector2(0,laserStartPos*32 + 16)
		laserXYPos[1] = Vector2(480,laserStartPos*32 + 16)
	
	warnLines = LASERLINES.instance()
	if vert == 0:
		warnLines.rotation_degrees = 90
	warnLines.position = laserXYPos[0]
	add_child(warnLines)
	
	laserStateArray[0] = true
	
func _process(delta):
	if laserStateArray[0] == true:
		Stage2()
	if laserStateArray[1] == true:
		Stage3()
	if laserStateArray[2] == true:
		Stage4()
	if laserStateArray[3] == true:
		destroy = true
	pass

func Stage2():
	warnLines.ScaleSelf(direct)
	if warnLines.ReturnState() == true and st2R1 == false: 
		st2R1 = true
		remove_child(warnLines)
		laserStateArray[1] = true
		
func Stage3():
	if st3R1 == false:
		st3R1 = true
		laserBody = LASER.instance()
		laserBody.position = laserXYPos[0]
		add_child(laserBody)
	if vert == 0:
		laserBody.rotation_degrees = 90
	laserBody.UpdatePosition(direct)
	if laserBody.ReturnState() == true:
		remove_child(laserBody)
		laserStateArray[2] = true
		
func Stage4():
	destroy = true
	pass
	
func ReturnState():
	return destroy

