extends Control

var selected_character = "doux"

var hover_doux: AudioStreamPlayer
var hover_mort: AudioStreamPlayer
var hover_tard: AudioStreamPlayer
var hover_vita: AudioStreamPlayer
var select_sound: AudioStreamPlayer

func _ready():
	get_tree().paused = false
	hover_doux = $AudioStreamPlayer_doux
	hover_mort = $AudioStreamPlayer_mort
	hover_tard = $AudioStreamPlayer_tard
	hover_vita = $AudioStreamPlayer_vita

	hover_doux.stream = load("res://asset/sound/hover_doux.wav")
	hover_mort.stream = load("res://asset/sound/hover_mort.wav")
	hover_tard.stream = load("res://asset/sound/hover_tard.wav")
	hover_vita.stream = load("res://asset/sound/hover_vita.wav")
	
	select_sound = $AudioStreamPlayer_select
	select_sound.stream = load("res://asset/sound/select.wav")

	$VBoxContainer/TextureButton_doux.connect("mouse_entered", Callable(self, "_on_button_hover_doux"))
	$VBoxContainer/TextureButton_mort.connect("mouse_entered", Callable(self, "_on_button_hover_mort"))
	$VBoxContainer/TextureButton_tard.connect("mouse_entered", Callable(self, "_on_button_hover_tard"))
	$VBoxContainer/TextureButton_vita.connect("mouse_entered", Callable(self, "_on_button_hover_vita"))

	$VBoxContainer/TextureButton_doux.pressed.connect(_on_select_doux)
	$VBoxContainer/TextureButton_mort.pressed.connect(_on_select_mort)
	$VBoxContainer/TextureButton_tard.pressed.connect(_on_select_tard)
	$VBoxContainer/TextureButton_vita.pressed.connect(_on_select_vita)
	$Button.pressed.connect(_on_start_game)

func _on_button_hover_doux():
	hover_doux.play()

func _on_button_hover_mort():
	hover_mort.play()

func _on_button_hover_tard():
	hover_tard.play()

func _on_button_hover_vita():
	hover_vita.play()

func _on_select_doux():
	selected_character = "doux"
	_highlight_button($VBoxContainer/TextureButton_doux)

func _on_select_mort():
	selected_character = "mort"
	_highlight_button($VBoxContainer/TextureButton_mort)

func _on_select_tard():
	selected_character = "tard"
	_highlight_button($VBoxContainer/TextureButton_tard)

func _on_select_vita():
	selected_character = "vita"
	_highlight_button($VBoxContainer/TextureButton_vita)

func _highlight_button(button):
	for btn in $VBoxContainer.get_children():
		btn.modulate = Color(1, 1, 1)
	button.modulate = Color(0.5, 0.8, 1)

func _on_start_game():
	select_sound.play()
	Global.selected_character = selected_character
	get_tree().change_scene_to_file("res://asset/scenes/main.tscn")
