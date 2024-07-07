extends Control
@export_category("Nós")
@export var control:Control=null
@export var h_box_container:HBoxContainer=null
@export_category("fonte habilidades")
@export var fonte:FontFile=null
@export var hb_font_color:Color
@export var hb_font_color_shadow:Color
@export_category("Material")
@export var cinza:Shader=null
# Called when the node enters the scene tree for the first time.
func _ready():
	for elementos in Global.habilidades:
		var caminho=str("res://Player/icon_skills/",Global.habilidades[elementos][0],".png")
		var imgtemp=load(caminho)
		var img= TextureRect.new()
		img.name=str(elementos)
		img.texture=imgtemp
		img.custom_minimum_size=Vector2(50,50)
		img.material=ShaderMaterial.new()
		h_box_container.add_child(img)
		var label=Label.new()
		label.add_theme_font_override("font",fonte)
		label["theme_override_font_sizes/font_size"]=30
		label["theme_override_colors/font_shadow_color"]=hb_font_color_shadow
		label.add_theme_color_override("font_color",hb_font_color)
		label.name=str("label_",elementos)
		label.text="o"
		control.add_child(label)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	for elementos in Global.habilidades:
		var label_p = get_node(str("label_",elementos))
		var img_p = get_node(str("container/VBoxContainer/HBoxContainer/",elementos))
		if(Global.time_await[elementos]!=0):
			img_p.material.shader=cinza
			label_p.text=str(Global.time_await[elementos])
			label_p.global_position.x=img_p.global_position.x+10
			label_p.global_position.y=img_p.global_position.y+12
		else:
			label_p.text=""
			img_p.material.shader=null
	
