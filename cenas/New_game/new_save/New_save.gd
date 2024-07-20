extends Control
class_name New_save
var class_selected:int=1
@export var slot:int=Global.slot
@export var name_input:LineEdit=null
@export var animation:AnimatedSprite2D=null
var classes={0:["human",[10,4,2,10],["habilidades array"]],1:["goblin",[10,40,2,10],["habilidades array"]],2:["mage",[10,2,2,110],["habilidades array"]]}
var total_classes=classes.size()
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(class_selected>total_classes-1):
		class_selected=0
	if(class_selected<0):
		class_selected=total_classes-1
	animation.play(classes[class_selected][0])

func _on_texture_button_pressed():
	class_selected-=1


func _on_texture_button_2_pressed():
	class_selected+=1


func _on_button_pressed():
	"""criar verificação se o nome está vazio"""
	creat_save()
	
func creat_save():
	var obj_playerdata=PlayerData.new()
	obj_playerdata.save_path=str("res://data/save_game_",Global.slot,".tres")
	obj_playerdata.create_basic_save(name_input.text,classes[class_selected][0],Global.slot)

