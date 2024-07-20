extends Node2D
var objdata=PlayerData.new()
var dictionary={0:{"batata":10}}
# Called when the node enters the scene tree for the first time.
func _ready():
	print(dictionary[0]["batata"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
