extends RigidBody2D


export var speedup = 4
const MAXSPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	var limit_bottom = get_viewport_rect().end.y
	
	for body in bodies:
		if body.is_in_group("bricks_group"):
			get_node("/root/TheWorld").score += 5
			body.queue_free()
		
		if body.get_name() == "Paddle":
			var speed = linear_velocity.length()
			var direction = position - body.get_node("Anchor").global_position
			var velocity = direction * min(speed + speedup*delta, MAXSPEED*delta)
			linear_velocity = velocity
			print("sentuh paddle " + str(position.y) + " - " + str(limit_bottom) )
		
	
	if position.y > limit_bottom:
		queue_free()
		
