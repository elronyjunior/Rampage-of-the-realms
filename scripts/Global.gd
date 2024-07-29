extends Node
var tela:Viewport
var vida
var FPS:bool=true
var coldown_0:bool=false
var coldown_1:bool=false
var coldown_2:bool=false
var navigation:bool=false
var time_await={0:0,1:0,2:0}
var slot:int
var label=Label.new()
var bullet_possition:Vector2
func _ready():
	DisplayServer.window_set_min_size(Vector2(800, 600))

func _notification(what):
		if(what==1006):
			await printscreen()
func printscreen():
	if(slot>0):
		await RenderingServer.frame_post_draw
		var viewport = get_viewport()
		var img = viewport.get_texture().get_image()
		img.save_png(str("res://data/img_save/",slot,".png"))
func _physics_process(_delta):
	pass
func load_game(save_path:String):
	var saved_data = ResourceLoader.load(save_path)
	var loaded_data = saved_data as PlayerData
	return loaded_data
func proporcional(tamanho_text:int,maximus:int):
	var tam_abertura = Vector2(1152, 648)
	var resolucao = get_viewport().size
	var text_size = tamanho_text
	var area_abertura = tam_abertura[0]*tam_abertura[1]
	var area_resolucao = resolucao[0]*resolucao[1]
	var diferenca = area_resolucao - area_abertura
	var percentual:int = (diferenca / area_abertura) * 100
	var resultado=(((float(text_size)/100)*percentual)+(text_size))
	if(resultado>=maximus):
		return maximus
	return resultado

#slot/tiro/tempo/dano
var habilidades={0:["ice",3,10],1:["fire",2,5],2:["ice",2,5]}
