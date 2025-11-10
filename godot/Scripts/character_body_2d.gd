extends CharacterBody2D

const SPEED = 200.0
const ACCEL = 2.0

var input: Vector2
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var tutorial_textbox = $TextEdit
@onready var optionsmenu = $OptionsMenu

func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input.normalized()
	
func _physics_process(delta: float) -> void:
	var playerInput = get_input()
	if(tutorialactive):
		if(Input.get_action_strength("right")):
			tutorialmoved = true
			animated_sprite.play("Right")
		elif(Input.get_action_strength("left")):
			animated_sprite.play("Left")
			tutorialmoved = true
		elif(Input.get_action_strength("down")):
			animated_sprite.play("Back")
			tutorialmoved = true
		elif(Input.get_action_strength("up")):
			animated_sprite.play("Forward")
			tutorialmoved = true
		elif(Input.get_action_strength("item_pickup")):
			tutorialitempickup = true
		elif(Input.get_action_strength("startspell")):
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
	await get_tree().create_timer(3.0).timeout
	tutorial_textbox.text = "To start, lets try moving around. Press one of the WASD keys to move around."
	tutorialactive = true
	
	if (tutorialmoved):
		tutorial_textbox.text = "Great Job! Now lets try picking up items. To do this press space"
	if (tutorialitempickup):
		tutorial_textbox.text = "Amazing! Lastly, lets try casting a spell! First, open up the spell book and pick a spell. Then, press shift and draw {INSERT SPELL HERE}(press shift to move on)."
	if (tutorialspellcast):
		#print("tutorial over")
		tutorial_textbox.visible = false
	
	
