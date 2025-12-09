extends Area2D


func _on_body_entered(_body):
	Inventory.addCoin()
	self.get_parent().queue_free()
	pass # Replace with function body.
