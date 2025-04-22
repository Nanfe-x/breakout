extends CanvasLayer

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels.tscn")

func _on_HowToButton_pressed():
	print("Show How to Play (optional feature)")
