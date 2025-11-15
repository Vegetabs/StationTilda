class_name Furniture
extends Area2D
## Class for interactable elements within the station render scene (doors, computers, etc).

@export var pos : Vector2i
@export var furn_name : String
@export var desc : String

var op_status : bool = true
var active : bool = false

func _status_to_str() -> String:
	if op_status == true:
		return "Functional"
	else:
		return "Broken"

func get_status() -> bool:
	return op_status

func swap_status() -> void:
	if op_status == true:
		op_status = false
	else:
		op_status = true

func display_furn_desc():
	SignalBus.display_furn_desc.emit(pos,get_desc_str())

func get_desc_str() -> String:
	return "Name: %s\nDescription: %s\nStatus: %s" % [furn_name,desc,_status_to_str()]