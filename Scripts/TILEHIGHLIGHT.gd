extends Sprite
var mousePos
var playerXY = Vector2.ZERO
var coordinateExtremes = [Vector2.ZERO,Vector2.ZERO,Vector2.ZERO,Vector2.ZERO]
var coordinatePlayer = [Vector2.ZERO,Vector2.ZERO,Vector2.ZERO,Vector2.ZERO]
var dist = 0
var direction = null


func _process(delta):
#	UpdateExtremes()
	FindQuadrant()
	pass
	
func _input(event):
	if  event is InputEventMouseMotion:
		mousePos = event.position
		
func setXY(XYPos):
	playerXY = Vector2(XYPos.x+16,XYPos.y+16)
#
func FindQuadrant():
	if mousePos:
		var tempSlope = (playerXY.y - mousePos.y)/((playerXY.x+0.001) - mousePos.x)
		dist = sqrt(pow((mousePos.x-playerXY.x),2) + pow((mousePos.y - playerXY.y),2))
		if tempSlope < 1 and tempSlope > -1:
			if mousePos.x < playerXY.x:
				direction = "left"
				if dist < 16 + 32*3:
					position.x = floor(mousePos.x/32) * 32
				else:
					position.x = playerXY.x - 16 - 32 * 3
				position.y = playerXY.y-16
			else:
				direction = "right"
				if dist < 16 + 32*3:
					position.x = floor(mousePos.x/32) * 32
				else:
					position.x = playerXY.x + 16 + 32 * 2
				position.y = playerXY.y - 16
		else:
			if mousePos.y < playerXY.y:
				direction = "up"
				if dist < 16 + 32 * 3:
					position.y = floor(mousePos.y/32) * 32
				else:
					position.y = playerXY.y - 16 - 32 * 3
				position.x = playerXY.x-16
				
			else:
				direction = "down"
				if dist < 16 + 32 * 3:
					position.y = floor(mousePos.y/32) * 32
				else:
					position.y = playerXY.y + 16 + 32 *2
				position.x = playerXY.x - 16
func ReturnDirection():
	return direction
