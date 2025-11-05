extends Node2D

var level: int = 1

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_credits_button_pressed() -> void:
	$CenterContainer/MainButtons.visible = false
	$CenterContainer/CredtisMenu.visible = true


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_back_button_pressed() -> void:
	$CenterContainer/MainButtons.visible = true
	$CenterContainer/CredtisMenu.visible = false
