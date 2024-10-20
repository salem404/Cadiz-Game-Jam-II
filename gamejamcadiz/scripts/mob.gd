extends CharacterBody2D

#TODO cambiar path cuando creemos el chiringuito
@onready var puerta: Marker2D = $"../Puerta"
@onready var mob: CharacterBody2D = $"."
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var label: Label = $ProgressBar/Label
@onready var frances: AnimatedSprite2D = $Frances
@onready var americano: AnimatedSprite2D = $Americano


var direction
var speed = 100.0
var health = 0
var max_health = 2
var random


func _ready() -> void:
	direction = global_position.direction_to(puerta.global_position)
	add_to_group("enemy")
	label.text = str(health) + " / " + str(max_health)
	progress_bar.value = health 
	
	randomize()
	random = randi() % 2

func _physics_process(delta: float) -> void:
	
	if(random == 0):
		americano.visible = true
		frances.visible = false
	else:
		americano.visible = false
		frances.visible = true
		
	
	
	velocity = direction * speed
	
	move_and_slide()

func take_damage():
	health += 1
	progress_bar.value = health 
	label.text = str(health) + " / " + str(max_health)
	if health == max_health:
		const MoneyScene = preload("res://scenes/money.tscn")
		var money_instance = MoneyScene.instantiate()
		money_instance.global_position = global_position
		get_parent().add_child(money_instance)
		queue_free()
