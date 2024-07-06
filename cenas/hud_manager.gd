extends Control
@export var ICE:TextureRect = null
@export var fire:TextureRect = null
@export var ice_text:Label =null
@export var fire_text:Label =null
@export var h_box_container:HBoxContainer=null

var ice_one:bool=true
var fire_one:bool=true
@export var control:Control=null
const cinza = preload("res://cenas/cinza.gdshader")
# Called when the node enters the scene tree for the first time.
func _ready():
	for elementos in Global.habilidades:
		var caminho=str("res://Player/icon_skills/",Global.habilidades[elementos][0],".png")
		var imgtemp=load(caminho)
		var img= TextureRect.new()
		img.name=str(elementos)
		img.texture=imgtemp
		img.custom_minimum_size=Vector2(50,50)
		h_box_container.add_child(img)
		var label=Label.new()
		label.name=str("label_",elementos)
		label.text="o"
		control.add_child(label)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	for elementos in Global.habilidades:
		var label_p = get_node(str("label_",elementos))
		var img_p = get_node(str("container/VBoxContainer/HBoxContainer/",elementos))
		if(Global.time_await[elementos]!=0):
			label_p.text=str(Global.time_await[elementos])
			label_p.global_position.x=img_p.global_position.x+10
			label_p.global_position.y=img_p.global_position.y+12
		else:
			label_p.text=""
	
