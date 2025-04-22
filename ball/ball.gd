extends RigidBody2D

@export var speed: float = 400.0
var launched = false

func _ready():
	# Start with a short delay before launching the ball
	await get_tree().create_timer(1.0).timeout
	launch_ball()
	
	
func launch_ball():
	# Launch the ball in a diagonal direction
	var direction = Vector2(1, -1).normalized()
	linear_velocity = direction * speed
	launched = true

func _integrate_forces(state: PhysicsDirectBodyState2D):
	if launched:
		var v = state.linear_velocity
		# If speed drops too low (rare), reset direction
		if v.length() < 10.0:
			v = Vector2(1, -1).normalized() * speed
		else:
			v = v.normalized() * speed
		state.linear_velocity = v

# ✅ Trigger Game Over when ball touches bottom
func _on_body_entered(body):
	if body.name == "BottomWall":
		linear_velocity = Vector2.ZERO
		launched = false
		
		# Pause game and show Game Over UI
		var ui = get_tree().get_root().get_node("level1: GameoverUI") # Adjust this to match your scene
		if ui:
			ui.call("show_game_over")
