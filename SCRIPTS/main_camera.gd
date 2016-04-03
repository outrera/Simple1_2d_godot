
extends Camera2D

var mousepos
var mx
var my

func _ready():
	set_process(true)

func move_cam(mousepos):
	mx = mousepos.x
	my = mousepos.y
	var max_my = get_viewport_rect().size.y - get_viewport_rect().size.y/10
	var max_mx = get_viewport_rect().size.x - get_viewport_rect().size.x/10
	var min_my = get_viewport_rect().size.y/10
	var min_mx = get_viewport_rect().size.x/10
	var vx = get_viewport_rect().size.x/10 + 10
	var vy = get_viewport_rect().size.y/10 + 10
	
	if mx < min_mx and my < min_my:
		set_pos(get_camera_pos() + Vector2(-vx,-vy))
		
	if mx > max_mx and my > max_my:
		set_pos(get_camera_pos() + Vector2(vx,vy))

	if mx > max_mx and my < min_my:
		set_pos(get_camera_pos() + Vector2(vx,-vy))
	
	if mx < min_mx and my > max_my:
		set_pos(get_camera_pos() + Vector2(-vx,vy))
	
	if mx > min_mx and mx < max_mx and my < min_my:
		set_pos(get_camera_pos() + Vector2(0,-vy))
	
	if mx > min_mx and mx < max_mx and my > max_my:
		set_pos(get_camera_pos() + Vector2(0,vy))
	
	if mx < min_mx and my > min_my and my < max_my:
		set_pos(get_camera_pos() + Vector2(-vx,0))
	
	if mx > max_mx and my > min_my and my < max_my:
		set_pos(get_camera_pos() + Vector2(vx,0))

func _process(delta):
	mousepos = get_viewport().get_mouse_pos()
	move_cam(mousepos)


func _on_Button_zoomPlus_pressed():
	set_zoom(get_zoom() + Vector2(1,1))

func _on_Button_zoomMinus_pressed():
	if get_zoom() > Vector2(1,1):
		set_zoom(get_zoom() - Vector2(1,1))

func _on_Button_zoomNormal_pressed():
	set_zoom(Vector2(1,1))
