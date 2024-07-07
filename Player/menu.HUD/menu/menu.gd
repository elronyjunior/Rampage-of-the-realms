extends CanvasLayer
@onready var menu = $"."
# Called when the node enters the scene tree for the first time.
func _ready():
	menu.visible=false
func _unhandled_input(event):
	if(event.is_action_pressed("ui_cancel") && !Global.navigation):
		menu.visible=true
		get_tree().paused=true
		
	
func _on_btn_resume_pressed():
	menu.visible=false
	get_tree().paused=false


func _on_btn_config_pressed():
	var config:= preload("res://Player/menu.HUD/config/config.tscn").instantiate()
	Global.navigation=true
	menu.visible=false
	menu.add_child(config)


func _on_btn_quit_pressed():
	get_tree().quit()
