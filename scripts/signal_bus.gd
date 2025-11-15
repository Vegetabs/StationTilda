extends Node

signal request_pos_nav(mem_id : int, pos : Vector2i)

signal send_poi_nav(mem_id : int, pos_arr : PackedVector2Array)

signal display_furn_desc(pos : Vector2i, desc : String)