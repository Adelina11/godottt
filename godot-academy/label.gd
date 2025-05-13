extends Label

@export var fade_speed: float = 0.5  # Скорость проявления

var alpha: float = 0.0  # Начальная прозрачность
var can_fade: bool = false  # Флаг для начала проявления

func _ready():
	modulate = Color(1, 1, 1, 0)  # Делаем текст полностью прозрачным (обновлено)
	await get_tree().create_timer(1.0).timeout  # Ждём 2 секунды
	can_fade = true  # Разрешаем проявление

func _process(delta):
	if can_fade and alpha < 1.0:
		alpha = min(alpha + fade_speed * delta, 1.0)  # Увеличиваем прозрачность
		modulate.a = alpha  # Теперь правильно меняем прозрачность
