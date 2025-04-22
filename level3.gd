extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		print("Ball fell below!")
		call_deferred("_handle_ball_fall", body)

func _handle_ball_fall(body):
	# Stop ball movement
	body.linear_velocity = Vector2.ZERO
	body.angular_velocity = 0
	body.sleeping = true
	PhysicsServer2D.body_set_mode(body.get_rid(), PhysicsServer2D.BODY_MODE_STATIC)

	# Move ball above paddle
	var paddle = get_node("Paddle") # Adjust if not direct child
	body.position = paddle.position - Vector2(0, 40)

	await get_tree().create_timer(0.5).timeout

	# Show Game Over UI
	var game_over_ui = get_node("GameOverUI")
	if game_over_ui:
		game_over_ui.visible = true

	await get_tree().create_timer(0.1).timeout # Allow UI to render

	show_game_over()


func show_game_over():
	print("🎮 GAME OVER")
	get_tree().paused = true
