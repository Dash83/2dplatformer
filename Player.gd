extends KinematicBody2D

var score: int = 0
var speed: int = 200
var jumpForce: int = 600
var gravity: int = 800
var drag: int = 20

var vel: Vector2 = Vector2()

#onready var sprite: Sprite = get_node("Sprite")
onready var sprite: Sprite = get_node("AnimatedSprite")
onready var ui: Node = get_node("/root/MainScene/CanvasLayer/UI")
onready var audioPlayer: Node = get_node("/root/MainScene/Camera2D/AudioPlayer")

func _physics_process(delta):
	vel.x = 0
	
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
	
	vel = move_and_slide(vel, Vector2.UP)
	
	if vel.x != 0:
		sprite.play("walk")
	elif vel.y != 0:
		sprite.play("jump")
	else:
		sprite.play("still")

	#Gravity
	vel.y += gravity * delta
	
	#Jump out
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
		sprite.play("jump")
	
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false
		
		#vel.x = max(vel.x - drag, 0)

func die():
	#get_tree().reload_current_scene()
	get_tree().change_scene("res://TitleScreen.tscn")
	#visible = false

	
func collect_coin(value):
	score += value
	ui.set_score_text(score)
	audioPlayer.play_coin_sfx()

	
