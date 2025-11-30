extends CharacterBody2D

const SPEED = 200.0
const ACCEL = 2.0

var input: Vector2
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

#func to_isometric(vec: Vector2) -> Vector2:
	## Convert normal x/y movement to isometric direction
	#return Vector2(
		#vec.x - vec.y,
		#(vec.x + vec.y) * 0.5
	#)

func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")

	return input.normalized()
	#return to_isometric(normalized)

func _physics_process(delta: float) -> void:
	var playerInput = get_input()

	if Input.is_action_pressed("right"):
		animated_sprite.play("Right")
	elif Input.is_action_pressed("left"):
		animated_sprite.play("Left")
	elif Input.is_action_pressed("down"):
		animated_sprite.play("Back")
	elif Input.is_action_pressed("up"):
		animated_sprite.play("Forward")
	else:
		animated_sprite.play("Idle")

	if playerInput == Vector2.ZERO:
		velocity = Vector2.ZERO
	else:
		velocity = lerp(velocity, playerInput * SPEED, delta * ACCEL)

	move_and_slide()
