extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_new_game_gui_input(event):
	if event.get_class() == "InputEventMouseButton" and event.pressed == true:
		get_tree().change_scene("res://MainScene.tscn")
	if event.get_class() == "InputeEventMouseOver":
		pass
