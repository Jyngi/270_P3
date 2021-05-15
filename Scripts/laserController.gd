extends Sprite

const LASER_OBJECT = preload("res://Scene/laserOBJ.tscn")

var laserOBJArr = []
var laserIndex = -1
var levelArr = [1,2,3,4,5,6,7]
var timer = 0

func _process(delta):
	timer += 1
	if timer > 30:
		timer = 0
		laserIndex += 1
		laserOBJArr.append(LASER_OBJECT.instance())
		add_child(laserOBJArr[laserIndex])
	for i in range(len(laserOBJArr)):
		if i >= len(laserOBJArr):
			break
		if laserOBJArr[i].ReturnState() == true:
			laserIndex -= 1
			remove_child(laserOBJArr[i])
			laserOBJArr.pop_front()
	pass
