extends EquippableItem

class_name HarvestingTool

@export var effected_types: Array[ResourceNodeType]
@export var min_damage: int = 1
@export var max_damage: int = 1

func interact_with_body(body):
	if(body is ResourceNode):
		for type in effected_types:
			if (body.resource_node_type.has(type)):
				body.harvest(randi_range(min_damage, max_damage))
