@tool
extends Sprite2D

@export var equipped_item : EquippableItem:
	set(new_item):
		equipped_item = new_item
		self.texture = equipped_item.texture

func _on_tool_hit_box_body_entered(body):
	if(equipped_item.has_method('interact_with_body')):
		equipped_item.interact_with_body(body)
