extends StaticBody2D

class_name ResourceNode

@export var resource_node_type: Array[ResourceNodeType]
@export var starting_resources: int = 1
@export var pickup_type: PackedScene
@export var launch_speed = 300
@export var launch_time = 0.25

@onready var levelParent = get_parent()

var current_resources: int:
	set(value):
		current_resources = value

		if (value <= 0):
			queue_free()

func _ready():
	current_resources = starting_resources

func harvest(amount: int):
	for x in amount:
		spawn_resource()
	current_resources -= amount

func spawn_resource():
	var pickup_instance: Pickup = pickup_type.instantiate() as Pickup
	levelParent.add_child(pickup_instance)
	pickup_instance.position = position

	var direction: Vector2 = Vector2(
		randf_range(-1.0, 1.0),
		randf_range(-1.0, 1.0)
	).normalized()
	pickup_instance.launch(direction * launch_speed, launch_time)
