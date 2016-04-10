
extends Node2D


func _ready():
	set_process(true)

func _process(delta):
	pass
	
func save_screenshot(filename):
	get_viewport().queue_screen_capture()
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	var screenshot = get_viewport().get_screen_capture()
	screenshot.save_png(filename)
	
func _on_Button_screenShot_pressed():
	save_screenshot('screenshot.png')



