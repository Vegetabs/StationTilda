class_name Crewmember
extends Node2D

enum Role {RESEARCH, MECHANIC, SECURITY}

var member_id : int
var member_name : String
var role : int
var health : int
var target_pos : Vector2i
var current_pos : Vector2i

func _init(id, role_num) -> void:
	member_id = id
	member_name = _generate_rand_name()
	role = role_num
	health = 5

func _ready() -> void:
	SignalBus.send_furn_pos.connect(receive_furn_pos)
	SignalBus.send_pos_nav.connect(receive_pos_nav)

## Used to give the crewmember a random name on run time (currently a stub).
func _generate_rand_name() -> String:
	return "John Smith"

## Gets the string value of the crewmember's role (used when user inspects crewmember).
func _role_num_to_str():
	match role:
		0:
			return "Researcher"
		1:
			return "Mechanic"
		2:
			return "Security Officer"

## Gets health heuristic string (used when user inspects crewmember).
func _health_to_str() -> String:
	if health >= 5:
		return "Perfect"
	elif health == 4:
		return "Fine"
	elif health >= 2 and health <= 3:
		return "Injured"
	else:
		return "Critical"

func request_furn_pos():
	SignalBus.request_furn_pos.emit(member_id)

func receive_furn_pos(mem_id, pos):
	if mem_id == member_id:
		target_pos = pos
		request_pos_nav()

func request_pos_nav():
	SignalBus.request_pos_nav.emit(member_id, target_pos)

func receive_pos_nav(mem_id, pos_arr):
	if mem_id == member_id:
		if len(pos_arr) >= 1:
			move(pos_arr)

func move(pos_arr):
	pass

## Returns formatted string used when user inspects crewmember
func get_str_desc() -> String:
	return "Name: %s (%s)\nRole: %s\nHealth: %s" % [member_name,member_id,_role_num_to_str(),_health_to_str()]