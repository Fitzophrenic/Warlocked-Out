extends Node

var _items: Dictionary[Item, ItemStack]
var _coins: int
var _collectables: int

func getItem(key: Item) -> Item:
	return _items.get(key).item_type

func addItem(key: Item) -> void:
	#check if item has key and incriment if it does
	if _items.has(key):
		_items.get(key).stack_count += 1
		return
	#if item does not have key create new item stack with the key type and set it to 1
	var new_stack: ItemStack = ItemStack.new()
	new_stack.item_type = key
	new_stack.stack_count = 1
	_items.set(key, 0)
		
func addCoin() -> void:
	_coins += 1
func getCoins() -> int:
	return _coins
	
func addCollectable() -> void:
	_collectables += 1
func getCollectables() -> int:
	return _collectables

#returns true if item is removed completely
func removeItem(key: Item) -> bool:
	#check to make sure item even has key before proceeding
	if !_items.has(key):
		return true
	
	_items.get(key).stack_count -= 1
	if(_items.get(key).stack_count == 0):
		_items.erase(key)
		return true
	return false
