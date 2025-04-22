extends Area2D

func _on_area_entered(area):
	if area.name == "Ball":
		area.queue_free()
		get_tree().reload_current_scene()
