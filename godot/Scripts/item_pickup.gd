extends Area2D

var entered = false


func _on_body_entered(body: PhysicalBone2D):
	entered = true


func _on_body_exited(body):
	entered = false


func _process(delta: float):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			return entered
