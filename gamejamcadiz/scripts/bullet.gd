extends Area2D

@onready var sprite_gamba: Sprite2D = $SpriteGamba
@onready var sprite_pescado: Sprite2D = $SpritePescado


const speed = 500
const RANGE = 1200
var travelled_distance = 0
var random

func _ready():
	randomize()
	random = randi() % 2

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	
	if(random == 0):
		sprite_gamba.visible = true
		sprite_pescado.visible = false
	else:
		sprite_gamba.visible = false
		sprite_pescado.visible = true
		
	
	position += direction * speed * delta
	travelled_distance += speed * delta
	if travelled_distance > RANGE:
		queue_free()
	
	sprite_gamba.rotate(35 * delta)
	sprite_pescado.rotate(10 * delta)
	
func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
