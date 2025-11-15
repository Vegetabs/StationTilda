class_name StateMachine
extends Node2D

enum State {
	Move,
	Repair,
	Research,
	Wait
}

var state_queue : Array[int] = []

func _ready() -> void:
	state_queue.append(State.Wait)

func process_tick():
	if len(state_queue) == 0:
		state_queue.append(State.Wait)
	pass