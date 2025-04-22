extends RigidBody2D

@export var speed: float = 300.0
var launched = false

func _ready():
	await get_tree().create_timer(1.0).timeout
	launch_ball()

func launch_ball():
	var direction = Vector2(1, -1).normalized()
	linear_velocity = direction * speed
	launched = true

func _integrate_forces(state: PhysicsDirectBodyState2D):
	if launched:
		var v = state.get_linear_velocity()
		if v.length() < 10.0:
			v = Vector2(1, -1).normalized() * speed
		state.set_linear_velocity(v.normalized() * speed)
