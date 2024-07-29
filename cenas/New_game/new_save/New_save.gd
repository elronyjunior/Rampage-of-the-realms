extends Control
class_name New_save
var class_selected:int=1
@export var slot:int=Global.slot
@export var name_input:LineEdit=null
@export var animation:AnimatedSprite2D=null
@export var label_class:Label=null
var btn_selectd=0
var classes={0:["Human",[10,4,2,10],["habilidades array"]],1:["Goblin",[10,40,2,10],["habilidades array"]],2:["Mage",[10,2,2,110],["habilidades array"]],3:["Knight",[10,2,2,110],["habilidades array"]],4:["Evil",[10,2,2,110],["habilidades array"]]}
var total_classes=classes.size()
# Called when the node enters the scene tree for the first time.
var obj_playerdata=PlayerData.new()
func _ready():
	get_node("PanelContainer/VBoxContainer/MarginContainer/VboxClass/Button1")["button_pressed"]=true
	animation.play("default")
	get_viewport().size_changed.connect(text_change)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	label_class.text=classes[btn_selectd][0]

func text_change():
	for i in range(5):
		var label=get_node(str("PanelContainer/VBoxContainer/MarginContainer/VboxClass/Button",i+1))
		label["theme_override_font_sizes/font_size"]=Global.proporcional(16,35)
	get_node("class")["theme_override_font_sizes/font_size"]=Global.proporcional(36,50)
	get_node("PanelContainer/VBoxContainer/PanelContainer/text_class")["theme_override_font_sizes/font_size"]=Global.proporcional(16,35)
	get_node("VBoxContainer/name")["theme_override_font_sizes/font_size"]=Global.proporcional(31,55)
func _on_button_pressed():
	"""criar verificação se o nome está vazio"""
	creat_save()
	get_tree().change_scene_to_file("res://cenas/Tutorial/Tutorial.tscn")
	
func creat_save():
	obj_playerdata.save_path=str("res://data/save_game_",Global.slot,".tres")
	obj_playerdata.create_basic_save(name_input.text,classes[btn_selectd][0],classes[btn_selectd][1],Global.slot)


func btn_class_1():
	btn_selectd=0


func btn_class_2():
	btn_selectd=1


func btn_class_3():
	btn_selectd=2


func btn_class_4():
	btn_selectd=3


func btn_class_5():
	btn_selectd=4
