extends Control

@onready var optionsmenu = $OptionsMenu
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_startgame_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	print("Start Pressed. Game Started.")
	
func _on_settings_pressed():
	optionsmenu.visible = true
	print("Options Pressed")
	
	
func _on_exit_pressed():
	get_tree().quit()
	print("Exit Pressed. Exiting.")
