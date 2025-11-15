class_name Crew
extends Node2D
## Management class for the NPC crew members of Station Tilda.

@onready var station_render := get_parent()

## Dictionary for storing point-of-interest map positions (Non-door objects are next to object and not on top of it)
const POI_DICT : Dictionary = {
	"AnalysisPC": [Vector2i(12,17)],
	"Door": [Vector2i(4,5), Vector2i(4,17), Vector2i(8,11), Vector2i(10,5), Vector2i(10,17), Vector2i(18,8), Vector2i(18,14), Vector2i(21,11)],
	"ExternalAirlock": [Vector2i(22,11)],
	"Oxygen": [Vector2i(12,5)],
	"Reactor": [Vector2i(2,5)],
	"ResearchPC": [Vector2i(18,16), Vector2i(18,18), Vector2i(18,20)],
	"TildaPC": [Vector2i(2,17)]
}

func _ready() -> void:
	pass

## Method for allowing child crewmembers to access POI map positions
func get_POI_pos(poi_name, index) -> Vector2i:
	return POI_DICT[poi_name][index]
