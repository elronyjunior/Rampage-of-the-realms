extends Node
var vida
var time: =2
var fire_time: =2
var ice_coldown:bool=false
var fire_coldown:bool=false
var coldown_0:bool=false
var coldown_1:bool=false
var coldown_2:bool=false
var time_await={0:0,1:0,2:0}

var bullet_possition:Vector2

#slot/tiro/tempo/dano
var habilidades={0:["ice",3,10],1:["fire",2,5],2:["empty",2,5]}
