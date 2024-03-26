extends CharacterBody2D

class_name Player

@export var normalSpeed: float = 100.0

@onready var animation_tree: AnimationTree = $AnimationTree

var direction: Vector2 = Vector2.ZERO

func _ready():
	animation_tree.active = true

func _process(delta):
	update_animation_params()

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("move_left","move_right","move_up","move_down").normalized()

	if direction:
		velocity = direction * normalSpeed
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func update_animation_params():

	if(velocity == Vector2.ZERO):
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true

	if (Input.is_action_just_pressed('use') and direction == Vector2.ZERO ):
		animation_tree["parameters/conditions/swing"] = true
	else:
		animation_tree["parameters/conditions/swing"] = false
	if(direction != Vector2.ZERO):
		animation_tree["parameters/idle/blend_position"] = direction.x
		animation_tree["parameters/moving/blend_position"] = direction.x
		animation_tree["parameters/swing/blend_position"] = direction.x
