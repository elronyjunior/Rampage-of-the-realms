extends CanvasLayer
@onready var config = $".."
@export var VboxConatiner:VBoxContainer=null
var tema_input:=preload("res://Player/menu.HUD/temas/Input_config.tres")
var inputs=[]
# Called when the node enters the scene tree for the first time.
func _ready():
	create_inputs()
	create_list()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(_event):
	pass

func _on_btn_quit_pressed():
	get_parent().visible=true
	Global.navigation=false
	queue_free()

func create_btn():
	pass

func create_inputs():
	var x:int=0
	for i in InputMap.get_actions():
		x+=1
		if(x>76):
			inputs.append(i)

func create_list():
	var achou:bool=false
	for elementos in inputs:
		var hbox=HBoxContainer.new()
		var label=Label.new()
		var btn_key=Button.new()
		hbox.name=str("Hbox_",elementos)
		label.name=str("label_",elementos)
		btn_key.name=str("btn_",elementos)
		label.text=elementos
		label.theme=tema_input
		btn_key.theme=tema_input
		for i in str(InputMap.action_get_events(elementos)):
			if(achou):
				btn_key.text=str(i)
				achou=false
			if(i=="("):
				achou=true
		VboxConatiner.add_child(hbox)
		hbox.add_child(label)
		hbox.add_child(btn_key)
		



