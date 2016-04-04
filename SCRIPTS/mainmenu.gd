extends Node2D
onready var centr_container = get_node('CenterContainer') 

func _ready():
	set_process(true)
	
func _process(delta):
	var x = get_viewport_rect().size.x
	var y = get_viewport_rect().size.y
	centr_container.set_size(Vector2(x,y))
	
func _on_ButtonExit_pressed():
	get_tree().quit()

func _on_ButtonStart_pressed():
	get_tree().change_scene('res://SCENES/main.scn') 