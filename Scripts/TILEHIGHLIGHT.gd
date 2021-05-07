extends Sprite
var mousePos
var playerXY = Vector2.ZERO
var coordinateExtremes = [Vector2.ZERO,Vector2.ZERO,Vector2.ZERO,Vector2.ZERO]
var coordinatePlayer = [Vector2.ZERO,Vector2.ZERO,Vector2.ZERO,Vector2.ZERO]
func _process(delta):
#	UpdateExtremes()
	FindQuadrant()
	pass
	
func _input(event):
	if  event is InputEventMouseMotion:
		mousePos = event.position
		
func setXY(XYPos):
	playerXY = XYPos
#func UpdateExtremes():
#	if playerXY:
#		for i in range(2):
#			coordinatePlayer[i] = Vector2(playerXY.x + (32 * i),playerXY.y)
#		for i in range(2):
#			coordinatePlayer[i+2] = Vector2(playerXY.x + (32* i),playerXY.y+32)
#
func FindQuadrant():
	if mousePos:
		var tempSlope = (playerXY.y - mousePos.y)/((playerXY.x+0.001) - mousePos.x)
		var dist = sqrt(pow((mousePos.x-playerXY.x),2) + pow((mousePos.y - playerXY.y),2))
		print(dist)
		if tempSlope < 1 and tempSlope > -1:
			if mousePos.x < playerXY.x:
				print("left")
			else:
				print("right")
		else:
			if mousePos.y < playerXY.y:
				print("top")
			else:
				print("bot")
