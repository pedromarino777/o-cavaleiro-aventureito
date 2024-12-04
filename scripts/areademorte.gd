extends Area2D

@onready var timer: Timer = $Timer
@onready var somMorte: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var hit: AudioStreamPlayer2D = $hit

func _on_body_entered(body: Node2D) -> void:
	print("Você morreu")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	hit.play()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	somMorte.play()
	get_tree().reload_current_scene()
