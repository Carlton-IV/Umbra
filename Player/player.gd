extends CharacterBody2D

@onready var torso: AnimatedSprite2D = $Torso

@onready var lefty: AnimatedSprite2D = $Torso/Shoulders/Lefty
@onready var righty: AnimatedSprite2D = $Torso/Shoulders/Righty
@onready var leg: AnimatedSprite2D = $Torso/Waist/Leg
@onready var reg: AnimatedSprite2D = $Torso/Waist/Reg

var arm_rot = 0
var leg_rot = 0

var rot_dir = 1

const SPEED = 600.0
const JUMP_VELOCITY = -1600.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	rotation_handling(direction)

func body_part_rotation():
	lefty.rotation_degrees = 8.7 - arm_rot
	righty.rotation_degrees = -12.2 + arm_rot
	leg.rotation_degrees = 0 + leg_rot
	reg.rotation_degrees = 6.9 - leg_rot

func ground_rotation(direction):
	var leg_target = 15
	var arm_target = 18
	if abs(lefty.rotation_degrees) >= arm_target:
		rot_dir *= -1
	if direction:
		arm_rot = move_toward(arm_rot, rot_dir * (arm_target+10), 2)
		leg_rot = move_toward(leg_rot, rot_dir * (leg_target+10), 2)
	else:
		rot_dir = 1
		arm_rot = move_toward(arm_rot, 0.0, 2)
		leg_rot = move_toward(leg_rot, 0.0, 2)
	body_part_rotation()

func rotation_handling(direction):
	ground_rotation(direction)
	body_part_rotation()
