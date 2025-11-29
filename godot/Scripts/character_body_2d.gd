extends CharacterBody2D

const SPEED = 200.0
const ACCEL = 2.0

var input: Vector2
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var tutorial_textbox = $TextEdit
@onready var optionsmenu = $OptionsMenu

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

	if tutorialactive:
		if Input.is_action_pressed("right"):
			tutorialmoved = true
			animated_sprite.play("Right")
		elif Input.is_action_pressed("left"):
			tutorialmoved = true
			animated_sprite.play("Left")
		elif Input.is_action_pressed("down"):
			tutorialmoved = true
			animated_sprite.play("Back")
		elif Input.is_action_pressed("up"):
			tutorialmoved = true
			animated_sprite.play("Forward")
		elif Input.is_action_pressed("item_pickup"):
			tutorialitempickup = true
		elif Input.is_action_pressed("startspell"):
			tutorialspellcast = true
		else:
			animated_sprite.play("Idle")

	if playerInput == Vector2.ZERO:
		velocity = Vector2.ZERO
	else:
		velocity = lerp(velocity, playerInput * SPEED, delta * ACCEL)

	move_and_slide()
	
func _on_settings_pressed():
	optionsmenu.visible = true
	print("Options Pressed")
	
var tutorialactive = false
var tutorialmoved = false
var tutorialitempickup = false
var tutorialspellcast = false
var tutorialcompleted = false

func _ready() -> void:
	_tutorial_start()
	

func _process(delta: float) -> void:
	if(tutorialcompleted == false):
		_tutorial_start()
		
func _tutorial_start() -> void:
	#print("tutorial start")
	#await get_tree().create_timer(3.0).timeout
	tutorial_textbox.text = "To start, lets try moving around. Press one of the WASD keys to move around."
	tutorialactive = true
	
	if (tutorialmoved):
		tutorial_textbox.text = "Great Job! Now lets try picking up items. To do this press space"
	if (tutorialitempickup):
		tutorial_textbox.text = "Amazing! Lastly, lets try casting a spell! First, open up the spell book and pick a spell. Then, press shift and draw {INSERT SPELL HERE}(press shift to move on)."
	if (tutorialspellcast):
		#print("tutorial over")
		tutorial_textbox.visible = false
	
	
