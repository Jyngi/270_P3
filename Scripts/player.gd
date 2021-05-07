extends Sprite
# Tile Distance per key input
const MOVEMENT_RANGE = 3
# Moving State
var movingState = false
# UP DOWN RIGHT LEFT
var directionIndex = [false,false,false,false]
var currentXY = Vector2.ZERO
var futureXY = Vector2.ZERO
var originalXY = Vector2.ZERO
var runOnce = false
var movementTimer = 0
var movementTimerMax = 30

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if movingState == false:
		if Input.is_action_just_pressed("ui_up"):
			movingState = true
			directionIndex[0] = true
			pass
		if Input.is_action_just_pressed("ui_down"):
			movingState = true
			directionIndex[1] = true
			pass
		if Input.is_action_just_pressed("ui_right"):
			movingState = true
			directionIndex[2] = true
			pass
		if Input.is_action_just_pressed("ui_left"):
			movingState = true
			directionIndex[3] = true
	if movingState == true:
		movementTimer += 1
		Movement(directionIndex.find(true,0))
func Movement(index):
	if runOnce == false:
		runOnce = true
		originalXY = Vector2(floor(position.x/32),floor(position.y/32))

		if index == 0:
			futureXY = Vector2(originalXY.x,originalXY.y - MOVEMENT_RANGE)
		if index == 1:
			futureXY = Vector2(originalXY.x,originalXY.y + MOVEMENT_RANGE)
		if index == 2:
			futureXY = Vector2(originalXY.x + MOVEMENT_RANGE, originalXY.y)
		if index == 3:
			futureXY = Vector2(originalXY.x - MOVEMENT_RANGE, originalXY.y)
	
	currentXY = Vector2(floor(position.x/32),floor(position.y/32))
		
	if currentXY != futureXY and movementTimer > movementTimerMax:
		movementTimer = 0
		if index == 0:
			position.y -= 32
		if index == 1:
			position.y += 32
		if index == 2:
			position.x += 32
		if index == 3:
			position.x -= 32
	if currentXY == futureXY:
		runOnce = false
		movingState = false
		directionIndex = [false,false,false,false]
	pass
