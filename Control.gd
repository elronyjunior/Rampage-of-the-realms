extends Control
@onready var control = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	print(acha_filhos(control,"Label"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func acha_filhos(node_pai:Node,tipe:String,excecoes:Array=[],array_filhos:Array=[]):
	var banido:bool=false
	for filho in node_pai.get_children():
		if(filho.get_child_count()>0):
			acha_filhos(filho,tipe,excecoes,array_filhos)
		if excecoes != []:
			for excecao in excecoes:
				if filho.name==str(excecao):
					banido=true
		if filho.is_class(tipe) && !banido:
			array_filhos.append(filho)
		banido=false
	return array_filhos
