class_name Crew
extends Node2D
## Management class for the NPC crew members of Station Tilda.

## Dictionary for storing point of interests map positions
const POI_DICT : Dictionary = {
	"Door": [],
	"ResearchPC": [],
	"AnalysisPC": [],
	"TildaPC": [],
	"Reactor": [Vector2i(1,5)],
	"Oxygen": [Vector2i(13,5)]
}

func _ready() -> void:
	pass

func request_path_to_POI(poi_name, index) -> Vector2i:
	return POI_DICT[poi_name][index]