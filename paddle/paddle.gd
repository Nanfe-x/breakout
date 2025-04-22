extends StaticBody2D

@export var speed: float = 400.0

func _process(delta):
	var direction = 0.0

	# Check for left and right input
	if Input.is_action_pressed("ui_left"):
		direction -= 1.0
	if Input.is_action_pressed("ui_right"):
		direction += 1.0

	# Move the paddle by directly changing its position
	position.x += direction * speed * delta
