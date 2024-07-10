extends Control
@export var animation:AnimationPlayer=null
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("fade_in")

func _on_btn_quit_pressed():
	get_tree().quit()


func _on_btn_continue_pressed():
	get_tree().change_scene_to_file("res://cenas/test.tscn")


func _on_btn_new_game_pressed():
	get_tree().change_scene_to_file("res://cenas/test.tscn")


func _on_config_pressed():
	pass # Replace with function body.
