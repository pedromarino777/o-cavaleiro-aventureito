extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -325.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var pulo_som: AudioStreamPlayer2D = $AudioStreamPlayer2D

# @export var attacking = false

#func _process(delta):
	#if Input.is_action_just_pressed("attack"):
		##attack()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		pulo_som.play()

	# Decide a direção do personagem: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Vira o Sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	# Executa a animação
	#if !attacking:
	if is_on_floor():
		if direction ==0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
	
	# Aplica o movimento
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

#func attack():
	#attacking = true
	#animated_sprite_2d.play("attack")
