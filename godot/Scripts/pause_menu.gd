extends Control
	
func _ready():
	hide()
	$AnimationPlayer.play("RESET")

func resume():
	hide()
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	
func pause():
	show()
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testOptions():
	if Input.is_action_just_pressed("pause_menu") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("pause_menu") and get_tree().paused:
		resume()


func _on_resume_pressed() -> void:
	resume()


func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _process(delta):
	testOptions()
