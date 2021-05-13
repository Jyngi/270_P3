extends Sprite

var timer = 0
var counter = 0
var destroy = false
var d = 0
var r1 = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var initPos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	initPos = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	d = delta
	timer += delta
	if r1 == true:
		counter += delta
	pass
func UpdatePosition(direction):
	if timer*10 < 1:
		scale = Vector2(15,timer*10)
		CheckCollision(direction)
	if timer > 1:
		CheckCollision(direction)
		modulate = Color(1,1,1,2-timer)
	if timer > 2:
		destroy = true
		pass
func ReturnState():
	return destroy
func CheckCollision(direction):
	if direction == 0:
		if position.x - 16 == Global.playerPos.x:
			print("collision")
	
