extends Node2D

onready var player = get_node("Player")
onready var ui = get_node("CanvasLayer/UI")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func game_over():
	ui.set_final_score_text(player.score)
	player.queue_free()
	
