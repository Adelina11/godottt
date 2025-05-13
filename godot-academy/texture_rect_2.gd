extends TextureRect

@export var fade_speed: float = 0.5  # Скорость проявления

var alpha: float = 0.0  # Начальная прозрачность
var can_fade: bool = false  # Флаг для начала проявления

func _ready():
	modulate = Color(1, 1, 1, alpha)  # Делаем картинку полностью прозрачной
	await get_tree().create_timer(0.5).timeout  # Ждем 2 секунды
	can_fade = true  # Разрешаем проявление

func _process(delta):
	if can_fade and alpha < 1.0:
		alpha = min(alpha + fade_speed * delta, 1.0)  # Увеличиваем прозрачность
		modulate = Color(1, 1, 1, alpha)  # Применяем прозрачность
