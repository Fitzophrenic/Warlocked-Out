extends Area2D

@export var door_tilemap_top: TileMapLayer
@export var door_tilemap_bottom: TileMapLayer
@export var gesture_type: String
var entered = false

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.is_in_group("player"):
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
			if ResultStore.recognized_name == gesture_type:
				disable_door()

func disable_door():
	entered = false
	door_tilemap_top.visible = false
	door_tilemap_bottom.visible = false
	
	door_tilemap_top.collision_enabled = false
	door_tilemap_bottom.collision_enabled = false
