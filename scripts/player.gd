extends CharacterBody3D
class_name Player

@onready var ray_cast_3d = $Camera/Ray

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


var wind_force := Vector3.ZERO

const FOOT_STEP_001 = preload("res://resources/sounds/Footstep/FootStep-001.wav")
const FOOT_STEP_002 = preload("res://resources/sounds/Footstep/FootStep-002.wav")
const FOOT_STEP_003 = preload("res://resources/sounds/Footstep/FootStep-003.wav")
const FOOT_STEP_004 = preload("res://resources/sounds/Footstep/FootStep-004.wav")
const FOOT_STEP_005 = preload("res://resources/sounds/Footstep/FootStep-005.wav")
const FOOT_STEP_006 = preload("res://resources/sounds/Footstep/FootStep-006.wav")
const FOOT_STEP_007 = preload("res://resources/sounds/Footstep/FootStep-007.wav")
var footstep_sounds = [FOOT_STEP_001, FOOT_STEP_002, FOOT_STEP_003, FOOT_STEP_004, FOOT_STEP_005, FOOT_STEP_006, FOOT_STEP_007]
@onready var step_sounds = $StepSounds
@onready var step_timer = $StepTimer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Get the player camera
@onready var main_camera := $Camera

# Make the camera variables
var camera_rotation := Vector2(0, 0)
var mouse_sensitivity := 0.005


func _ready() -> void:
	# Remove the mouse from the screen and just capture its movement
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event) -> void:
	# If escape is pressed reveal the mouse
	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	# Get the mouse movement
	if event is InputEventMouseMotion:
		# Get how much the mouse has moved and pass it onto the camera_look function
		var relative_position = event.relative * mouse_sensitivity
		camera_look(relative_position)


# Rotate the camera
func camera_look(movement: Vector2) -> void:
	# Add how much the camera has moved to the camera rotation
	camera_rotation += movement
	# Stop the player from making the camera go upside down by looking too far up and down
	camera_rotation.y = clamp(camera_rotation.y, deg_to_rad(-90), deg_to_rad(90))

	# Reset the transform basis
	transform.basis = Basis()
	main_camera.transform.basis = Basis()

	# Finally rotate the object, the player and camera needs to rotate on the x and only the camera should rotate on the y
	rotate_object_local(Vector3.UP, -camera_rotation.x)
	main_camera.rotate_object_local(Vector3.RIGHT, -camera_rotation.y)


func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if velocity.length() > 0 and step_timer.is_stopped() and is_on_floor():
		var sound = footstep_sounds.pick_random()
		step_sounds.stream = sound
		step_sounds.play()
		step_timer.start()
	
	# Apply wind force to character's velocity
	velocity += wind_force
	if is_on_wall():
		velocity += get_wall_normal() * wind_force.length()
	if velocity.y > 5:
		velocity.y = 5
	
	move_and_slide()
	
	if Input.is_action_just_pressed("interact"):
		var collided_object = ray_cast_3d.get_collider()
		if collided_object:
			if collided_object.has_method("interact"):
				collided_object.interact()
