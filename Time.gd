extends Timer

onready var ui = get_node("/root/MainScene/CanvasLayer/UI")
onready var player = get_node("/root/MainScene/Player")
var ms = 0
var sec = 180

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ms < 0:
		ms = 9
		sec -= 1
	ui.set_time_text(str(sec) + "." + str(ms))
	
	if sec <= 0:
		player.die()

func _on_Timer_timeout():
	ms -= 1
	
func get_time():
	return sec
