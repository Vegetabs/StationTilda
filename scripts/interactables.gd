extends Node2D

var furn_arr : Array[Node]

func _ready() -> void:
	furn_arr = get_children()

func get_furniture_pos(id) -> Vector2i:
	for i in furn_arr:
		if i.get_furn_id() == id:
			return i.get_furn_pos()
	return Vector2i()