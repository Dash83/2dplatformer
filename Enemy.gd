extends Area2D

export var speed: int = 100
export var moveDist: int = 100
onready var startX: int = position.x
onready var targetX: int = position.x + moveDist

func move_to(current, to, step):
	var new = current
	if new < to:
		new = min(new + step, to)
	else:
		new = max(new - step, to)
	return new	

func _process(delta):
	position.x = move_to(position.x, targetX, speed * delta)
	
	#Time to change directions?
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX


func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die()
