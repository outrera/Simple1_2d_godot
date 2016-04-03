extends TileMap

onready var ground = get_node("../ground")
var tile_grass = 0
var tile_wather = 1
var tile_tree = 2
var tile_stone = 3

class RndCoord:
	var x 
	var y 
	func _init(x_max, y_max):
		x = randi() % x_max
		y = randi() % y_max
		var _z = randi() % 4
		if _z == 1:
			x = -x
			y = -y
		if _z == 2:
			y = -y
		if _z == 3:
			x = -x

func spawn_object(tile, x, y):
	if get_cell(x,y) == tile_grass:
		set_cell(x,y,tile)
		
func rnd_spawn_objects(tile, n, x_max, y_max):
	for count in range(0, n):
		var rcoord = RndCoord.new(x_max, y_max)
		spawn_object(tile, rcoord.x, rcoord.y)
		
func gen_area(tile, n, count_obj_max, x_max, y_max):
	for count in range(0, n):
		var count_obj = 0
		var dir = 0
		var rcoord = RndCoord.new(x_max, y_max)
		var x = rcoord.x
		var y = rcoord.y
		while count_obj != count_obj_max:	
			dir = randi() % 4
	
			if dir == 0:
				x+=1
			if dir == 1:
				x+=-1
			if dir == 2:
				y+=1
			if dir == 3:
				y+=-1
				
			spawn_object(tile, x, y)
			count_obj += 1

func gen_forest(n, m, x_max, y_max):
	gen_area(tile_tree, n, m, x_max, y_max)
		
func gen_lakes(n, m, x_max, y_max):
	gen_area(tile_wather, n, m, x_max, y_max)
	
func gen_rocks(n, m, x_max, y_max):
	gen_area(tile_stone, n, m, x_max, y_max)
	
func fill_grass(x1, x2, y1, y2):
	for x in range(x1, x2):
		for y in range(y1, y2):
			set_cell(x, y, tile_grass)

func gen_map(x1, x2, y1, y2):
	fill_grass(x1, x2, y1, y2)
	gen_lakes(200,200, x2, y2)
	gen_forest(200,200, x2, y2)
	gen_rocks(200, 20, x2, y2)
	
func _ready():
	randomize()
	gen_map(-128, 384, -256, 256)
	set_process(true)

func _process(delta):
	
	print()
	

