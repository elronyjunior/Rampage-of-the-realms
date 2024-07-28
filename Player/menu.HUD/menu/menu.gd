extends CanvasLayer
@onready var menu = $"."
var printData= Screenshot.new()
var load_data=printData.load_print()

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


func _on_btn_screenshot_pressed():
	menu.visible=false
	await tirarPrint()
	menu.visible=true
 
func tirarPrint():
	await RenderingServer.frame_post_draw
	var viewport = get_viewport()
	var img = viewport.get_texture().get_image()
	img.save_png(str("user://",load_data.screenshot_load + 1,".png"))
	printData.save_print(load_data.screenshot_load + 1)

