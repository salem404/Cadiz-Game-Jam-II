extends Control
class_name HUD

@export var label: Label
@export var timer_label: Label
@onready var timer: Timer = $Timer

var time_left: int = 120
var timer_started: bool = false

func _ready() -> void:
	# Conectamos la señal timeout del Timer al método _on_Timer_timeout
	timer.timeout.connect(_on_Timer_timeout)  # Conectar señal usando la referencia directa
	# Iniciamos el Timer
	timer.start()
	update_timer_label()

func update_score(current_score: int, max_score: int):
	label.text = str(current_score) + " / " + str(max_score)

# Función que se ejecuta cada vez que el Timer termina (una vez por segundo)
func _on_Timer_timeout() -> void:
	time_left -= 1
	update_timer_label() 

	if time_left <= 0:
		time_left = 0
		timer.stop()
		get_tree().change_scene_to_file("res://scenes/win.tscn")

# Función para actualizar la etiqueta que muestra el tiempo restante
func update_timer_label() -> void:
	var minutes = int(time_left) / 60
	var seconds = int(time_left) % 60
	timer_label.text = str(minutes) + ":" + str(seconds)
