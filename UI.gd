extends Control

onready var score_text = get_node("Elements/Score/ScoreText")
onready var time_text = get_node("Elements/Time/TimeLabel")
onready var score_display = get_node("ScoreDisplay")
func _ready():
	score_text.text = "0"
	
func set_score_text(score):
	score_text.text = str(score)

func set_time_text(time):
	time_text.text = time
	
func set_final_score_text(score):
	score_display.set_text(score)
	
