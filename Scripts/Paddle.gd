extends KinematicBody2D

const ball_scene = preload("res://SubScenes/Ball.tscn")
var jumlahBola = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process_input(true)
	

func _physics_process(delta):
	var mouse_x = get_viewport().get_mouse_position().x
	position = Vector2(mouse_x, position.y)

func _input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if jumlahBola < 1:
			var ball = ball_scene.instance()
			ball.position.y = position.y - 16
			ball.position.x = position.x + 16
			get_tree().root.add_child(ball)
			jumlahBola = jumlahBola + 1
