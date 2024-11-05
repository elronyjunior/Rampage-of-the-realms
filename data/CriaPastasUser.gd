extends Node
func _ready() -> void:
	var diretorio=DirAccess.open(str("user://"))
	print(DirAccess.open(str("user://")))

func cria_pasta_UserData(path:String):
	var dir = DirAccess.open(str("user://",path,"/"))
	if dir !=null:
		if not dir.dir_exists(str("user://",path,"/")):
			var result = DirAccess.make_dir_absolute(str("user://",path,"/"))
			if result == OK:
				print("Pasta criada com sucesso!")
			else:
				print("Erro ao criar pasta.")
