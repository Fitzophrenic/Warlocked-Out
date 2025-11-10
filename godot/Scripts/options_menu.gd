extends Control

#
#func _ready() -> void:
	#pass # Replace with function body.
	
func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	print("Menu back Pressed")
