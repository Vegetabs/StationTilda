extends CollisionShape2D

@onready var furn = self.get_parent()

func _on_furniture_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
		furn.display_furn_desc()