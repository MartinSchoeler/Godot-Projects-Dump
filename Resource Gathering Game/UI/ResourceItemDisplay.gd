extends HBoxContainer

class_name ResourceItemDisplay

@onready var displayTexture: TextureRect = $DisplayTexture
@onready var label: Label = $Label

var resource_type: ResourceItem:
	set(new_resource):
		resource_type = new_resource
		displayTexture.texture = new_resource.texture

func update_count(count: int):
	label.text = str(count)
