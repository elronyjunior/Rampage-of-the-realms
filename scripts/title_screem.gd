extends Control
@export var animation:AnimationPlayer=null
# Called when the node enters the scene tree for the first time.
func _ready():
	check_continue()
	animation.play("fade_in")

func check_continue():
	var btn_continue=get_node("HBoxContainer/VBoxContainer/btn_continue")
	var separator=get_node("HBoxContainer/VBoxContainer/HSeparator")
	for i in range(3):
		if(FileAccess.file_exists(str("res://data/save_game_",i+1,".tres"))):
			btn_continue.visible=true
			separator.visible=true
func _on_btn_quit_pressed():
	get_tree().quit()


func _on_btn_continue_pressed():
	get_tree().change_scene_to_file("res://cenas/load game/select_load.tscn")


func _on_btn_new_game_pressed():
	get_tree().change_scene_to_file("res://cenas/New_game/slots/select_save.tscn")


func _on_config_pressed():
	pass # Replace with function body.
