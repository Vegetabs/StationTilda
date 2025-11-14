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
	pass