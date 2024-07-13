extends Resource
class_name  PlayerData
var save_path="res://data/save_game.tres"
@export var Save_Player_Position:Vector2
@export var screenshot_load:int
@export var key_binds={}

func Update_posision(position:Vector2):
	Save_Player_Position=position

func save_print(N:int):
	screenshot_load=N
	
func save_game():
	ResourceSaver.save(self,save_path)
	
func load_game():
	var saved_data = ResourceLoader.load(save_path)
	var loaded_data = saved_data as PlayerData
	return loaded_data

