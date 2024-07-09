extends CanvasLayer
@onready var config = $".."
@export var VboxConatiner:VBoxContainer=null
@export var HboxContainer:HBoxContainer=null
@export var margin_container:MarginContainer=null
var tema_input:=preload("res://Player/menu.HUD/temas/Input_config.tres")
var inputs=[]
var tecla=" "
# Called when the node enters the scene tree for the first time.
func _ready():
	create_inputs()
	create_list()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
		var func_ref = get(str("_",elementos))	
		btn_key.pressed.connect(func_ref)
		VboxConatiner.add_child(hbox)
		hbox.add_child(label)
		hbox.add_child(btn_key)
func _input(event):
	if(margin_container.visible && not event is InputEventMouseMotion && not event is InputEventMouseButton):
		var achou_text:bool=false
		InputMap.action_erase_events(tecla)
		InputMap.action_add_event(tecla,event)
		for n in str(InputMap.action_get_events(tecla)):
			if(achou_text==true):
				var btn_name=get_node(str("Control/BoxContainer/VBoxContainer/Hbox_",tecla,"/btn_",tecla))
				btn_name.text=n
				achou_text=false
			if(n=="("):
				achou_text=true
		margin_container.visible=false
func createpanel():
	margin_container.visible=true
func _cima():
	tecla="cima"
	createpanel()
func _baixo():
	tecla="baixo"
	createpanel()
func _esquerda():
	tecla="esquerda"
	createpanel()
func _direita():
	tecla="direita"
	createpanel()
func _attack():
	tecla="attack"
	createpanel()
func _0():
	tecla="0"
	createpanel()
func _1():
	tecla="1"
	createpanel()
func _2():
	tecla="2"
	createpanel()
		

func _on_button_pressed():
	margin_container.visible=false
