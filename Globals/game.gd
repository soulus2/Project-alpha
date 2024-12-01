extends Node3D

@export var mouse_capture:bool = false
@export var fullscreen:bool = false
var window_mode_changed:bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	
	if event.is_action_pressed("mouse_capture"):
		mouse_capture = !mouse_capture
	if event.is_action_pressed("fullscreen"):
		fullscreen = !fullscreen
		window_mode_changed = true
func _process(delta: float) -> void:
	if mouse_capture:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if window_mode_changed:
		window_mode_changed = false
		if fullscreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
