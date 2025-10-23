extends CharacterBody2D

const SPEED = 200.0
const ACCEL = 2.0

var input: Vector2
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input.normalized()
	
func _physics_process(delta: float) -> void:
	var playerInput = get_input()
	
	if(Input.get_action_strength("right")):
		animated_sprite.play("Right")
	elif(Input.get_action_strength("left")):
		animated_sprite.play("Left")
	elif(Input.get_action_strength("down")):
		animated_sprite.play("Back")
	elif(Input.get_action_strength("up")):
		animated_sprite.play("Forward")
	else:
		animated_sprite.play("Idle")
	
	if playerInput == Vector2.ZERO:
		velocity = Vector2.ZERO
	else:
		velocity = lerp(velocity, playerInput * SPEED, delta * ACCEL)
	
	move_and_slide()
