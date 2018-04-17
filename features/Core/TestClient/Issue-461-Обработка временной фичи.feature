# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb

Функционал: Проверка обработки временных фич

Как разработчик
Я хочу чтобы корректно происходила обработка временных фич
Чтобы я мог иcпользовать для быстрой проверки сценариев

Сценарий: Проверка обработки временных фич
    Когда я открыл форму VanessaBehavoir в режиме самотестирования
	И     в поле "СгенерированныйСценарий" я ввожу текст фичи "ФичаДляПроверкиРаботСекцииКонтекст_Тег_tree"
	И Пауза 3
	И     таблица формы VanessaBehavior с именем "ДеревоТестов" стала равной:
		| 'Наименование'                                                                |
		| 'temp.feature'                                                                |
		| 'temp'                                                                        |
		| 'Контекст'                                                                    |
		| 'Когда Шаг один, который будет веткой дерева в секции Контекст'               |
		| 'Когда В панели разделов я выбираю "Основная"'                                |
		| 'И Шаг два'                                                                   |
		| 'Переход  к строке таблицы'                                                   |
		| 'Когда Шаг один'                                                              |
		| 'Когда В панели разделов я выбираю "Основная"'                                |
		| 'И Шаг два'                                                                   |
		
		
Сценарий: Проверка обработки записи действий пользователей
    Когда я открыл форму VanessaBehavoir в режиме самотестирования
	И     в поле "СгенерированныйXML" я ввожу запись действий пользователя
	И Пауза 3
	Тогда в поле "СгенерированныйСценарий" находится текст из макета "СгенерированныйСценарий"
	И Пауза 3
	И     я выполняю подготовку сценария к выполнению
	И Пауза 3
 	И     таблица формы VanessaBehavior с именем "ДеревоТестов" стала равной
		| 'Наименование'                                                                |
		| 'temp.feature'                                                                |
		| 'temp'                                                                        |
		| 'Контекст'                                                                    |
		| 'Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий' |
#		| 'Дано Я открыл новый сеанс TestClient или подключил уже существующий'         |
#		| 'И    Я закрыл все окна клиентского приложения'                               |
		| '<описание сценария>'                                                           |
		| 'И В командном интерфейсе я выбираю \'Основная\' \'Справочник1\''           |
		| 'Тогда открылось окно \'Справочник1\''                                          |
		| 'И я нажимаю на кнопку \'Создать\''                                         |
		| 'Тогда открылось окно \'Справочник1 (создание)\''                               |
		| 'И в поле \'Наименование\' я ввожу текст \'Тест\''                            |
		| 'И я нажимаю на кнопку \'Записать и закрыть\''                              |
		| 'И я жду закрытия окна \'Справочник1 (создание)\' в течение 20 секунд'|