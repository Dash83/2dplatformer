extends Area2D

export var speed: int = 100
export var moveDist: int = 100
onready var startX: int = position.x
onready var targetX: int = position.x + moveDist
#onready var world_vars = get_node("/root/WorldVariables")
onready var world_time = get_node("/root/MainScene/Timer")
onready var main_scene = get_node("/root/MainScene")

var rng = RandomNumberGenerator.new()
var acc_time = 0
const SPEED_UP_THRESHOLD = 5
const VISIBILITY_THRESHOLD = 4
const VISIBILITY_PROB = 0.20
const SPEEDUP = 1.10
const SPEEDUP_PROB = 0.10

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

	#Enemy upgrades
	if  visible == false and \
		180 - world_time.sec >= WorldVariables.danger_threshold:
			acc_time += delta
			if acc_time >= VISIBILITY_THRESHOLD:
				#Randomly speed up.
				var r = rng.randf_range(0, 1)
				if r <= VISIBILITY_PROB:
					visible = true
				#Reset acc_time
				acc_time = acc_time - VISIBILITY_THRESHOLD
			
	if  visible == true and \
		180 - world_time.sec >= WorldVariables.danger_threshold:
			acc_time += delta
			if acc_time >= SPEED_UP_THRESHOLD:
				#Randomly speed up.
				var r = rng.randf_range(0, 1)
				if r <= SPEEDUP_PROB:
					speed *= SPEEDUP
				#Reset acc_time
				acc_time = acc_time - SPEED_UP_THRESHOLD

func _on_Enemy_body_entered(body):
	if body.name == "Player" and visible == true:
		body.die()

func _ready():
	rng.randomize()
