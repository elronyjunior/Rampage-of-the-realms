extends Area2D
@export var animation_tree:AnimationTree=null
@export var surgir:float = 0.3
@export var timer_surgir:Timer=null
@export var speed:float =1
@export var ice_bullet:Sprite2D=null
@export var sumir:Timer=null
var quebrou:bool=false
@onready var ice_b = $"."



var state_machine
var direction:Vector2 
# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine= animation_tree["parameters/playback"]
	sumir.start()
	state_machine.travel("surgir")
func _process(_delta):
	move()
func set_direction(dir:Vector2):
	direction=dir
func move():
	if(quebrou):
		speed=0.1
	position.x=position.x+ direction.normalized().x * speed
	position.y=position.y+ direction.normalized().y * speed
func _on_surgir_timeout():
	if(!quebrou):
		state_machine.travel("spin")

func _on_animation_tree_animation_finished(_destroy):
	if(quebrou):
		queue_free()
func _on_sumir_timeout():
	#queue_free()
	pass

func _on_body_entered(body):
	if(body.is_in_group("inimigo")):
		state_machine.travel("destroy")
		quebrou=true


func _on_area_entered(area):
	if(area.is_in_group("inimigo")):
		state_machine.travel("destroy")
		quebrou=true
		
