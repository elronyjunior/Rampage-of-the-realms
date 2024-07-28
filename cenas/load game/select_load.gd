extends Control
@export var vbox:VBoxContainer=null
var erro=false
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(3):
		if(save_exists(str("res://data/save_game_",i+1,".tres"))):
			var load_obj=load_game(str("res://data/save_game_",i+1,".tres"))
			var load_slot=preload("res://cenas/load game/panel_container.tscn").instantiate()
			load_slot.name=str("slot_",i+1)
			load_slot.get_node("MarginContainer/save/HBoxContainer/nivel").text=str(load_obj.player_nivel)
			load_slot.get_node("MarginContainer/save/VBoxContainer/Name").text=load_obj.player_name
			load_slot.get_node("MarginContainer/save/VBoxContainer/class").text=load_obj.player_class
			var func_ref = get(str("btn_load_",i+1))
			load_slot.get_node("Button").pressed.connect(func_ref)
			vbox.add_child(load_slot)
			var separa= HSeparator.new()
			separa.custom_minimum_size=Vector2(271,30)
			separa.theme=preload("res://cenas/load game/load_tema.tres")
			vbox.add_child(separa)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func btn_load_1():
	inicia_jogo(1)
func btn_load_2():
	inicia_jogo(2)
func btn_load_3():
	inicia_jogo(3)
func load_game(save_path:String):
	var saved_data = ResourceLoader.load(save_path)
	var loaded_data = saved_data as PlayerData
	return loaded_data
func save_exists(path: String) -> bool:
	return FileAccess.file_exists(path)

func inicia_jogo(save:int):
	var path=str("res://data/save_game_",save,".tres")
	var load_obj=load_game(path)
	if(save_exists(path)):
		get_tree().change_scene_to_file(load_obj.curent_scene)

