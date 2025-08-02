class_name LvlSelectMenu extends Node

@onready var loading: CanvasLayer = $loading

func _ready() -> void:
	$loading.visible = true
	for btn in get_tree().get_nodes_in_group("level_button"):
		if btn is TouchScreenButton:
			# Convert name (StringName) to String and extract the number after "lvl"
			var name_str = String(btn.name)
			var lvl = int(name_str.substr(3, name_str.length() - 3))
			# Connect the pressed signal, binding the lvl argument
			btn.pressed.connect(Callable(self, "_on_level_pressed").bind(lvl))

func _on_level_pressed(lvl: int) -> void:
	AudioPlayer._play_fx_btn7()
	await get_tree().create_timer(0.2).timeout
	loading.transition()
	await loading.on_transition_finished
	
	var path = "res://res/scene/level/demo_level"
	GlobalVar.MaxReset = 3
	path += "_" + str(lvl) + ".tscn"
	# If that scene doesn't exist, go to 'coming_soon'
	if !ResourceLoader.exists(path):
		path = "res://res/scene/level/coming_soon.tscn"
	if lvl == 1 :
		get_tree().change_scene_to_file("res://res/scene/menu/cutscene/story1.tscn")
		return
	get_tree().change_scene_to_file(path)

func _on_back_pressed() -> void:
	AudioPlayer._play_fx_btn7()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://res/scene/menu/menu_home.tscn")
