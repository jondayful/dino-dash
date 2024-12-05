extends CanvasLayer

func _ready():
	$Button_Character.pressed.connect(_on_character_button_pressed)
	
func _on_character_button_pressed():
	get_tree().change_scene_to_file("res://asset/scenes/character_selection.tscn")
	
