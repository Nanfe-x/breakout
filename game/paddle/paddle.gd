extends CharacterBody2D

@export var speed: float = 400.0

func _physics_process(delta):
	var direction = 0.0

	if Input.is_action_pressed("ui_left"):
		direction -= 1.0
	if Input.is_action_pressed("ui_right"):
		direction += 1.0

	velocity.x = direction * speed
	velocity.y = 0
	move_and_slide()
