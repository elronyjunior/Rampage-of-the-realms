extends CanvasLayer
class_name Config
@onready var config = $".."
@export var VboxConatiner:VBoxContainer=null
@export var HboxContainer:HBoxContainer=null
@export var margin_container:MarginContainer=null
@export var label_panel:Label=null
var configData=ConfigData.new()
var load_inputs=configData.load_game()
var tema_input:=preload("res://Player/menu.HUD/temas/Input_config.tres")
var inputs=[]
var dicionario={}
var tecla=" "
# Called when the node enters the scene tree for the first time.
func _ready():
	create_inputs()
	load_key_binds()
	create_list()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_btn_quit_pressed():
	save_key_binds()
	configData.save_game()
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
	print(inputs)

func create_list():
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
		label.custom_minimum_size.x=160
		label.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER
		btn_key.custom_minimum_size.x=100
		btn_key.text=acha_tecla(elementos)
		var func_ref = get(str("_",elementos))	
		var separator:=VSeparator.new()
		separator.theme=tema_input
		btn_key.pressed.connect(func_ref)
		VboxConatiner.add_child(separator)
		VboxConatiner.add_child(hbox)
		hbox.add_child(label)
		hbox.add_child(btn_key)
func _input(event):
	if(margin_container.visible && not event is InputEventMouseMotion && not event is InputEventMouseButton):
		var redundancia=false
		for i in inputs:
			if acha_input(str(event)) == acha_tecla(i):
				redundancia=true
		if(redundancia):
			label_panel.text="esta tecla já esta em uso!"
		if(!redundancia):
			label_panel.text="aperte um input valido..."
			InputMap.action_erase_events(tecla)
			InputMap.action_add_event(tecla,event)
			var btn_name=get_node(str("Control/BoxContainer/VBoxContainer/Hbox_",tecla,"/btn_",tecla))
			btn_name.text=acha_tecla(tecla)
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
func _save():
	tecla="save"
	createpanel()

func _on_button_pressed():
	label_panel.text="aperte um input valido..."
	margin_container.visible=false

func acha_tecla(elementos:String):
	var achou:bool=false
	for i in str(InputMap.action_get_events(elementos)):
			if(achou):
				return i
			if(i=="("):
				achou=true
	return "não achou"

func acha_input(input:String):
	var achou:bool=false
	for i in input:
			if(achou):
				return i
			if(i=="("):
				achou=true
	return "não achou"
	
func save_key_binds():
	for input in inputs:
		configData.key_binds[input]=acha_tecla(input)

func load_key_binds():
	print(load_inputs)
	for i in load_inputs.key_binds:  # Supondo que `inputs` seja uma lista de ações
		var key_string = load_inputs.key_binds[i]  # Supondo que acha_tecla retorna a string da tecla desejada
		var code = OS.find_keycode_from_string(key_string)
		var event = InputEventKey.new()
		event.keycode=code
		InputMap.action_erase_events(i)
		InputMap.action_add_event(i, event)
