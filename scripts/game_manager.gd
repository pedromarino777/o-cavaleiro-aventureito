extends Node

var score = 0

@onready var congratulations: Label = %Congratulations

func add_point():
	score += 1
	print (score)
	if score == 10:
		# Espera 2 segundos antes de fechar o jogo
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/ganhou.tscn")
