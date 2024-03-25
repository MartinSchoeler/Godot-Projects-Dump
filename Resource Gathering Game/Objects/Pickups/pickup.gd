extends Area2D
class_name Pickup

@onready var collision_shape: CollisionShape2D = $Pickup_col
@export var resource_type: ResourceItem

var launch_velocity: Vector2 = Vector2.ZERO
var move_duration: float = 0
var time_since_launch: float = 0

var launching: bool = false:
	set(is_launching):
		launching = is_launching
		collision_shape.disabled = launching


func _ready():
	connect('body_entered', _on_body_entered)


func _process(delta):
	if launching:
		position += launch_velocity * delta
		time_since_launch += delta

		if time_since_launch >= move_duration:
			launching = false


func launch(velocity: Vector2, duration: float):
	launch_velocity = velocity
	time_since_launch = 0
	launching = true
	move_duration = duration


func _on_body_entered(body: Node2D):
	var inventory = body.find_child('Inventory')

	if (inventory):
		inventory.add_resources(resource_type, 1)
		queue_free()
