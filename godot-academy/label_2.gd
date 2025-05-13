extends Label

@export var full_text: String = "Поривет, сучки!"  # Текст, который нужно напечатать
@export var typing_speed: float = 0.1  # Скорость печати (секунд на символ)

var char_index: int = 0  # Индекс текущего символа
var typing_timer: float = 0.0  # Таймер для печати
var can_type: bool = false  # Флаг для начала печати

func _ready():
	text = ""  # Начинаем с пустого текста
	await get_tree().create_timer(2.0).timeout  # Ждём 2 секунды
	can_type = true  # Разрешаем печать

func _process(delta):
	if can_type:
		# Постепенная печать текста
		typing_timer += delta
		if typing_timer >= typing_speed and char_index < len(full_text):
			text = full_text.substr(0, char_index + 1)
			char_index += 1
			typing_timer = 0.0  # Сбрасываем таймер
