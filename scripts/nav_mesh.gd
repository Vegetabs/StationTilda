class_name NavMesh
extends TileMapLayer

const TILES : Dictionary = {
	"Wall": Vector2i(11,13),
	"Floor": Vector2i(9,15)
}

const CELL_SIZE := Vector2i(16,16)

var _astar = AStarGrid2D.new()

func _ready() -> void:
	_astar.region = Rect2i(0,0,23,24)
	_astar.cell_size = CELL_SIZE
	_astar.offset = CELL_SIZE*0.5
	_astar.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	_astar.default_estimate_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	_astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	_astar.update()

	# Sets all wall tiles to be impassable
	for i in range(_astar.region.position.x, _astar.region.end.x):
		for j in range(_astar.region.position.y, _astar.region.end.y):
			var pos = Vector2i(i, j)
			if get_cell_atlas_coords(pos) == TILES["Wall"]:
				set_passability(pos)

# Finds a path between two points given two MAP points
func find_path(start,end) -> PackedVector2Array:
	return _astar.get_point_path(start,end)

# Swaps the passability of a given MAP point
func set_passability(pos) -> void:
	_astar.set_point_solid(pos)

func _process(_delta: float) -> void:
	pass
