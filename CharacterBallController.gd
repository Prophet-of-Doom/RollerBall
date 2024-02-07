extends RigidBody3D

var camOffset = Vector3(0, 2.4, 3.5)
var cam
var rolling_force = 40;
# Called when the node enters the scene tree for the first time.
func _ready():
	cam = $CollisionShape3D/MeshInstance3D/BallCam
	cam.set_as_top_level(true)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	cam.global_position = lerp(cam.globa_position, global_position.global_translate(camOffset), 0.1)
	
	if Input.is_action_pressed("forward"):
		angular_velocity.x -= rolling_force*delta
	if Input.is_action_pressed("backward"):
		angular_velocity.x += rolling_force*delta
	if Input.is_action_pressed("left"):
		angular_velocity.z += rolling_force*delta
	if Input.is_action_pressed("right"):
		angular_velocity.z -= rolling_force*delta
