extends Control
class_name New_save
var class_selected:int=1
@export var slot:int=Global.slot
@export var name_input:LineEdit=null
@export var animation:AnimatedSprite2D=null
@export var label:Label=null
var btn_selectd=0
var classes={0:["human",[10,4,2,10],["habilidades array"]],1:["goblin",[10,40,2,10],["habilidades array"]],2:["mage",[10,2,2,110],["habilidades array"]]}
var total_classes=classes.size()
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("default")
	get_viewport().size_changed.connect(text1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func text1():
	label["theme_override_font_sizes/font_size"]=Global.text_proporcional(50,70)
func _on_button_pressed():
	"""criar verificação se o nome está vazio"""
	creat_save()
	
func creat_save():
	var obj_playerdata=PlayerData.new()
	obj_playerdata.save_path=str("res://data/save_game_",Global.slot,".tres")
	obj_playerdata.create_basic_save(name_input.text,classes[btn_selectd][0],Global.slot)


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
