extends Node

signal request_pos_nav(mem_id : int, pos : Vector2i)

signal send_pos_nav(mem_id : int, pos_arr : PackedVector2Array)

signal request_furn_pos(mem_id : int, furn_id : String)

signal send_furn_pos(mem_id : int, pos : Vector2i)

signal display_furn_desc(pos : Vector2i, desc : String)