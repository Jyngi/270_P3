extends Sprite


var timer = 0
var counter = 0
var destroy = false


func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter +=1
	timer += delta
	if timer >= 1:
		destroy = true
		
func ScaleSelf(direction):
	scale = Vector2(1.00,1.00-timer)
	if counter % 3 == 0 or counter % 4 == 0 or counter % 5 == 0:
		modulate = Color(1,0,0,1)
	else:
		modulate = Color(1,1,1,1)
		
func ReturnState():
	return destroy
	pass
