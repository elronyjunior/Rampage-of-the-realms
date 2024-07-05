extends Control
@export var ICE:TextureRect = null
@export var fire:TextureRect = null
@export var ice_text:Label =null
@export var fire_text:Label =null
@export var h_box_container:HBoxContainer=null

var ice_one:bool=true
var fire_one:bool=true
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
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
"""
	if(!Global.ice_coldown):
		ice_one=true
		ICE.material.shader=null
		ice_text.text=" "
	if(!Global.fire_coldown):
		fire_text.text=" "
		fire.material.shader=null
		fire_one=true
	if(Global.ice_coldown && ice_one):
		ICE.material.shader=cinza
		ice_one=false
	if(Global.fire_coldown && fire_one):
		fire.material.shader=cinza
		fire_one=false
	if(Global.ice_coldown):
		ice_text.text=str(Global.time)
	if(Global.fire_coldown):
		fire_text.text=str(Global.fire_time)
		"""
	
		
