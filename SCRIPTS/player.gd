
extends KinematicBody2D
onready var camera = get_node('../main_camera')

const MOTION_SPEED = 190

func _fixed_process(delta):
	var motion = Vector2()
	
	if (Input.is_action_pressed("ui_up")):
		motion += Vector2(0, -1)

	if (Input.is_action_pressed("ui_down")):
		motion += Vector2(0, 1)

	if (Input.is_action_pressed("ui_left")):
		motion += Vector2(-1, 0)

	if (Input.is_action_pressed("ui_right")):
		motion += Vector2(1, 0)

	motion = motion.normalized()*MOTION_SPEED*delta
	motion = move(motion)
	
	if (Input.is_action_pressed("ui_right") or 
		Input.is_action_pressed("ui_left") or 
		Input.is_action_pressed("ui_down") or
		Input.is_action_pressed("ui_up")):
		camera.set_pos(get_pos())
		


func _ready():
	set_fixed_process(true)

