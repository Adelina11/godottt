extends ColorRect

@onready var per = true

func _physics_process(delta: float) -> void:
	if per:
		color = Color(0, 0, 0, lerp(color.a, 1.0, 0.03))
		if color.a >= 0.9:
			per = false
