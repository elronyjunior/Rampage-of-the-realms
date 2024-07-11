extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var meu_dicionario = {"chave1": "valor1","chave2": "valor2"}
	meu_dicionario["nova_chave"] = "novo_valor"
	meu_dicionario["nova_chave2"] = "novo_valor2"
	print(meu_dicionario)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
