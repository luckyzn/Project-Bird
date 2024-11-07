extends Area2D

class_name Ground

signal mc_stop
@onready var sprite1: Sprite2D = $Sprite2D
@onready var sprite2: Sprite2D = $"../Ground2/Sprite2D"

var speed = -150

func _ready():
	sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()

func _process(delta):
	sprite1.global_position.x += speed * delta
	sprite2.global_position.x += speed * delta
	if sprite1.global_position.x < -sprite1.texture.get_width():
		sprite1.global_position.x = sprite2.global_position.x + sprite2.texture.get_width()
		
	if sprite2.global_position.x < -sprite2.texture.get_width():
		sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()
		
func on_body_entered(body):
	mc_stop.emit()
	(body as Main_char).stop()
	
	
func stop():
	speed = 0
