extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D

const speed = 500
const RANGE = 1200
var travelled_distance = 0

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	if travelled_distance > RANGE:
		queue_free()
	
	sprite_2d.rotate(15 * delta)

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
