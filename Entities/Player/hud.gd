extends Control
@onready var player = $"../../.."
@onready var health_bar = $Health_bar

func _ready() -> void:
	health_bar = player.get_max_health()
func _process(delta: float) -> void:
	$Health_bar.value = player.get_health()
