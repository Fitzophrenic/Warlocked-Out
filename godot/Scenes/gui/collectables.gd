extends Control

@export var Coins: Label
@export var Collectables: Label

func _process(_delta):
	Coins.text = "Coins: " + str(Inventory.getCoins())
	Collectables.text = "Collectables: " + str(Inventory.getCollectables())
