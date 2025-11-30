extends Area2D

var entered = false

func _on_body_entered(body: PhysicsBody2D):
	entered = true
	ResultStore.can_accept_name = true


func _on_body_exited(body):
	entered = false
	ResultStore.can_accept_name = false
	ResultStore.recognized_name = ""


func _process(delta: float):
	if entered == true:
		var recognized := ResultStore.recognized_name
		if ResultStore.can_accept_name:
			if ResultStore.recognized_name == "line":
				get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
