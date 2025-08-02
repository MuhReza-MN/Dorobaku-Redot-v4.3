class_name HomeMenu extends Node

@onready var loading: CanvasLayer = $loading

func _ready() -> void:
	AudioPlayer._play_music_menu()
	$loading.visible = true

func _press_btnCredits() -> void:
	AudioPlayer._play_fx_btn7()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://res/scene/menu/credits.tscn")

func _press_btnPlay() -> void:
	AudioPlayer._play_fx_btn7()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://res/scene/menu/menu_lvl.tscn")
