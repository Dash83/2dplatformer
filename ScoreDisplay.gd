extends Control

onready var final_score_label = get_node("VBoxContainer/FinalScore")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_text(score):
	final_score_label.text = str(score)
	visible = true
