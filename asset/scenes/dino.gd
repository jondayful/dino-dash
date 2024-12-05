extends CharacterBody2D

const GRAVITY: int = 4200
const JUMP_SPEED: int = -1600

var current_character

func _ready():
	var selected_character_name = Global.selected_character
	current_character = $CharacterHolder.get_node(selected_character_name)
	hide_all_characters_except(current_character)

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if is_on_floor():
		if not get_parent().game_running:
			current_character.play("idle")
		else:
			$RunCollision.disabled = false
			if Input.is_action_pressed("ui_accept"):
				velocity.y = JUMP_SPEED
				$JumpSound.play()
			elif Input.is_action_pressed("ui_down"):
				current_character.play("duck")
				$RunCollision.disabled = true
			else:
				current_character.play("run")
	else:
		current_character.play("jump")
	move_and_slide()

func hide_all_characters_except(character):
	for child in $CharacterHolder.get_children():
		if child != character:
			child.hide()
		else:
			child.show()

func switch_character(new_character_name):
	var new_character = $CharacterHolder.get_node(new_character_name)
	if new_character:
		current_character.hide()
		current_character = new_character
		current_character.show()
