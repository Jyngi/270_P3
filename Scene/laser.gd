extends Sprite

var timer = 0
var counter = 0
var destroy = false
var d = 0
var r1 = false

var initPos = Vector2.ZERO
var hurtBox = false


func _ready():
	initPos = position

func _process(delta):
	d = delta
	timer += delta
	if r1 == true:
		counter += delta
	if position.x >= Global.playerPos.x and position.x <= Global.playerPos.x+32:
		modulate = Color(0,0,1,1)
		Global.stock -= 1
	if position.y >= Global.playerPos.y and position.y <= Global.playerPos.y + 32:
		modulate = Color(0,0,1,1)
		Global.stock -= 1
	pass
	
func UpdatePosition(direction):

	if timer*10 < 1:
		scale = Vector2(15,timer*10)
	if timer > 1:
		modulate = Color(1,1,1,2-timer)
	if timer > 2:
		destroy = true
		pass
		
func ReturnState():
	return destroy
	
