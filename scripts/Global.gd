extends Node
var tela:Viewport
var vida
var FPS:bool=true
var coldown_0:bool=false
var coldown_1:bool=false
var coldown_2:bool=false
var navigation:bool=false
var time_await={0:0,1:0,2:0}

var bullet_possition:Vector2
func _ready():
	DisplayServer.window_set_min_size(Vector2(800, 600))

#slot/tiro/tempo/dano
var habilidades={0:["ice",3,10],1:["fire",2,5],2:["ice",2,5]}
