extends Node2D
class_name Inventory

@export var player_resources: Dictionary = { }

signal resource_count_changed(type: ResourceItem, newCount: int)

func add_resources(type: ResourceItem, value: int):
	if player_resources.has(type):
		player_resources[type] = player_resources[type] + value
	else:
		player_resources[type] = value

	print(player_resources)

	emit_signal('resource_count_changed', type, player_resources[type])
