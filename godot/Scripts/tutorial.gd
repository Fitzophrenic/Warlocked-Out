extends Label

@onready var tutorial_textbox = $"."
@onready var UI = $"../UI"
@onready var ped = $"../../PedistolArea"

var tutorialactive = false
var tutorialmoved = false
var tutorialitempickup = false
var tutorialspellcast = false
var tutorialcompleted = false

func _ready() -> void:
	UI.visible = false
	tutorial_textbox.text = "Move with W, A, S, or D. To continue Press Enter"

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		tutorial_textbox.text = "Go over to the Pedistol and press E"
	if event.is_action_pressed("item_pickup"):
		tutorial_textbox.text = "Open the Spell Book by pressing Shift"
	if event.is_action_pressed("startspell"):
		UI.visible = true
		tutorial_textbox.text = "Go over to the Door and draw a line. Right click to Submit"
		#print("tutorial over")
	var recognized := ResultStore.recognized_name
	if ResultStore.can_accept_name:
		if ResultStore.recognized_name == "line":
			tutorial_textbox.visible = false
			tutorialcompleted = true
