extends CharacterBody2D


class_name Main_char

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var jump_action = -300
@export var rotation_speed = 2
var should_process_input = true

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var max_speed = 400

func _ready():
	velocity = Vector2.ZERO
	
func _physics_process(delta):
	if Input.is_action_just_pressed("jump") && should_process_input:
		jump()
	
	velocity.y += gravity * delta
	
	velocity.y = min(velocity.y, max_speed)
	
	move_and_collide(velocity * delta)
		
func jump():
	velocity.y = jump_action
	rotation = deg_to_rad(-30)
func rotate_bird():
	if velocity.y > 0 && rad_to_deg(rotation) < 90:
		rotation += rotation_speed * deg_to_rad(1)
	
	elif velocity.y <= 0 && rad_to_deg(rotation) > -30:
		rotation -= rotation_speed * deg_to_rad(1)

func stop():
	animation_player.stop()
	gravity = 0
	velocity = Vector2.ZERO	
	should_process_input = false
