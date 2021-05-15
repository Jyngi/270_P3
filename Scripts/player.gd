extends Sprite
var left = texture
var rightTexture = null
var color = 1.0

func _process(delta):
	Global.playerPos = position	
	pass
func Teleport(XYPos):
	position.x = XYPos.x
	position.y = XYPos.y
	
