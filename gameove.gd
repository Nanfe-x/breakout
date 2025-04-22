extends CanvasLayer

@onready var game_node = get_tree().get_current_scene()

func show_game_over():
	visible = true
	get_tree().paused = true 


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu.tscn")
