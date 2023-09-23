﻿# language: ru
#parent uf:
@UF5_формирование_результатов_выполнения_сценариев
#parent ua:
@UA18_формировать_отчёт_Allure

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb

@IgnoreOnUFSovm82Builds
@IgnoreOn8312
@IgnoreOn8313
@IgnoreOn8314
@IgnoreOn8315
@IgnoreOn8316
@IgnoreOn8317
@IgnoreOn8318



Функционал: Проверка поиска основных элементов формы с помощью механизма UI Automation

Как разработчик
Я хочу чтобы при включении опции использовать Ui Automation и включении эмуляции действий мышкой
Происходили клики мышкой по элементам формы стандартными шагами


Сценарий: Проверка поиска основных элементов формы с помощью механизма UI Automation
	Дано Я закрыл все окна клиентского приложения
	И я закрываю сеанс TESTCLIENT
	Когда я запускаю служебный сеанс TestClient с ключом TestManager в той же базе

	Когда Я открываю VanessaAutomation в режиме TestClient со стандартной библиотекой

	Когда В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "UIAutomation/UIAutomation01"
	И я перехожу к закладке с именем "ГруппаНастройки"
	И я устанавливаю флаг с именем 'ИспользоватьКомпонентуVanessaExt'
	И я перехожу к закладке с именем "СтраницаАвтоИнструкции"
	И я устанавливаю флаг с именем 'ЭмулироватьДвиженияМышкиVanessaExt'
	И в поле с именем 'КоличествоШаговПриДвиженииМышкиVanessaExt' я ввожу текст '50'
	И я перехожу к следующему реквизиту
	И в поле с именем 'ПаузаМеждуШагамиПриДвиженииМышкиVanessaExt' я ввожу текст '2'
	И я перехожу к следующему реквизиту
		
	
	И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient
	И Я нажимаю на кнопку выполнить сценарии в Vanessa-Automation TestClient 500

	И я перехожу к закладке с именем "ГруппаЗапускТестов"
	И я нажимаю на кнопку с именем 'ФормаРазвернутьВсеСтрокиДереваСлужебный'
	Тогда таблица "ДеревоТестов" стала равной:
		| 'Наименование'                                                                                                                                                | 'Статус'  |
		| 'UIAutomation01.feature'                                                                                                                                      | ''        |
		| 'Базовый тест UI Automation'                                                                                                                                  | ''        |
		| 'Контекст'                                                                                                                                                    | ''        |
		| 'Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий'                                                                                 | 'Success' |
		| 'Базовый тест UI Automation'                                                                                                                                  | 'Success' |
		| '* Подготовка'                                                                                                                                                | ''        |
		| 'И я удаляю все элементы справочника "Справочник2"'                                                                                                           | 'Success' |
		| 'И В командном интерфейсе я выбираю \'Основная\' \'Справочник2\''                                                                                             | 'Success' |
		| 'Тогда открылось окно \'Справочник2\''                                                                                                                        | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ФормаСоздать\''                                                                                                             | 'Success' |
		| 'Тогда открылось окно \'Справочник2 (создание)\''                                                                                                             | 'Success' |
		| 'И в поле с именем \'Наименование\' я ввожу текст \'ТестовыйЭлемент20\''                                                                                      | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ФормаЗаписатьИЗакрыть\''                                                                                                    | 'Success' |
		| 'И я жду закрытия окна \'Справочник2 (создание) *\' в течение 20 секунд'                                                                                      | 'Success' |
		| 'Тогда открылось окно \'Справочник2\''                                                                                                                        | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ФормаСоздать\''                                                                                                             | 'Success' |
		| 'Тогда открылось окно \'Справочник2 (создание)\''                                                                                                             | 'Success' |
		| 'И в поле с именем \'Наименование\' я ввожу текст \'ТестовыйЭлемент21\''                                                                                      | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ФормаЗаписатьИЗакрыть\''                                                                                                    | 'Success' |
		| 'И я жду закрытия окна \'Справочник2 (создание) *\' в течение 20 секунд'                                                                                      | 'Success' |
		| '* Включение настроек'                                                                                                                                        | ''        |
		| 'И я устанавливаю флаг настройки Vanessa Automation "ИспользоватьUIAutomation"'                                                                               | 'Success' |
		| 'И я устанавливаю флаг настройки Vanessa Automation "ЭмулироватьДвиженияМышкиVanessaExt"'                                                                     | 'Success' |
		| '* Проверка поиска переключателей'                                                                                                                            | ''        |
		| 'И я активизирую окно текущего клиента тестирования'                                                                                                          | 'Success' |
		| 'И я закрываю все окна клиентского приложения'                                                                                                                | 'Success' |
		| 'И В командном интерфейсе я выбираю \'Основная\' \'Проверка выбор переключателя\''                                                                            | 'Success' |
		| 'Тогда открылось окно \'Проверка выбора переключателя\''                                                                                                      | 'Success' |
		| 'И я меняю значение переключателя с именем \'ПоВсемРаспоряжениям2\' на \'по выделенным распоряжениям\''                                                       | 'Success' |
		| 'И я меняю значение переключателя с именем \'НастройкаФормированияПоПомещениям\' на \'по всем помещениям\''                                                   | 'Success' |
		| 'И я меняю значение переключателя с именем \'НастройкаФормированияПоПомещениям1\' на \'по одному помещению\''                                                 | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ОК\''                                                                                                                       | 'Success' |
		| '* Проверка поиска подсистем, у которых есть перенос строки в названии'                                                                                       | ''        |
		| 'И В командном интерфейсе я выбираю \'Подсистема с очень длинным наименованием\' \'Справочник1\''                                                             | 'Success' |
		| 'И пауза 1'                                                                                                                                                   | 'Success' |
		| 'И Я закрыл все окна клиентского приложения'                                                                                                                  | 'Success' |
		| '*Открытие формы элемента'                                                                                                                                    | ''        |
		| 'И В командном интерфейсе я выбираю \'Основная\' \'Справочник1\''                                                                                             | 'Success' |
		| 'Тогда открылось окно \'Справочник1\''                                                                                                                        | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ФормаСоздать\''                                                                                                             | 'Success' |
		| 'Тогда открылось окно \'Справочник1 (создание)\''                                                                                                             | 'Success' |
		| '*Работа с кнопками в командной панели'                                                                                                                       | ''        |
		| 'И я нажимаю на кнопку с именем \'ФормаКомандаВГруппеКомаднойПанели1\''                                                                                       | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ФормаКомандаВГруппеКомаднойПанели2\''                                                                                       | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ФормаКомандаВГруппеКомаднойПанели3\''                                                                                       | 'Success' |
		| 'И пауза 1'                                                                                                                                                   | 'Success' |
		| 'И я очищаю окно сообщений пользователю'                                                                                                                      | 'Success' |
		| '*Работа с полями'                                                                                                                                            | ''        |
		| 'И в поле с именем \'Наименование\' я ввожу текст \'111\''                                                                                                    | 'Success' |
		| 'И из выпадающего списка с именем "Реквизит1" я выбираю по строке \'ЗначениеПеречисления1\''                                                                  | 'Success' |
		| 'И я активизирую поле с именем "РеквизитЧисло"'                                                                                                               | 'Success' |
		| 'И в поле с именем \'РеквизитЧисло\' я ввожу текст \'123,45\''                                                                                                | 'Success' |
		| 'И в поле с именем "РеквизитЧисло" я ввожу текст "12 34,00"'                                                                                                  | 'Success' |
		| 'И в поле с именем \'РеквизитСтрока\' я ввожу текст \'ТестСтрока\''                                                                                           | 'Success' |
		| 'И в поле с именем \'РеквизитДата\' я ввожу текст \'08.04.1981\''                                                                                             | 'Success' |
		| 'И я нажимаю кнопку очистить у поля с именем "Реквизит1"'                                                                                                     | 'Success' |
		| 'И в поле с именем \'Наименование\' я ввожу текст \'222\''                                                                                                    | 'Success' |
		| 'И из выпадающего списка с именем "Реквизит1" я выбираю точное значение \'ЗначениеПеречисления1\''                                                            | 'Success' |
		| 'И из выпадающего списка с именем "Реквизит1" я выбираю точное значение \'ЗначениеПеречисления2\''                                                            | 'Success' |
		| 'И я нажимаю кнопку выбора у поля с именем "Реквизит2"'                                                                                                       | 'Success' |
		| 'Тогда открылось окно \'Справочник2\''                                                                                                                        | 'Success' |
		| 'И в таблице "Список" я перехожу к строке:'                                                                                                                   | 'Success' |
		| '\| \'Наименование\'      \|'                                                                                                                                 | ''        |
		| '\| \'ТестовыйЭлемент20\' \|'                                                                                                                                 | ''        |
		| 'И я нажимаю на кнопку с именем \'ФормаВыбрать\''                                                                                                             | 'Success' |
		| 'И я устанавливаю флаг с именем \'РеквизитБулево\''                                                                                                           | 'Success' |
		| 'Тогда открылось окно \'Справочник1 (соз*\''                                                                                                                  | 'Success' |
		| 'И я нажимаю кнопку выбора у поля с именем "Реквизит4"'                                                                                                       | 'Success' |
		| 'Тогда открылось окно \'Справочник2\''                                                                                                                        | 'Success' |
		| 'И в таблице "Список" я перехожу к строке:'                                                                                                                   | 'Success' |
		| '\| \'Наименование\'      \|'                                                                                                                                 | ''        |
		| '\| \'ТестовыйЭлемент21\' \|'                                                                                                                                 | ''        |
		| 'И я нажимаю на кнопку с именем \'ФормаВыбрать\''                                                                                                             | 'Success' |
		| 'Тогда открылось окно \'Справочник1 (соз*\''                                                                                                                  | 'Success' |
		| 'И я нажимаю кнопку очистить у поля с именем "Реквизит4"'                                                                                                     | 'Success' |
		| 'И я меняю значение переключателя с именем \'РеквизитПереключатель\' на \'Первое значение\''                                                                  | 'Success' |
		| 'И я меняю значение переключателя с именем \'РеквизитПереключатель\' на \'Второе значение\''                                                                  | 'Success' |
		| 'И я меняю значение переключателя с именем \'РеквизитПереключательВысотаСтроки2\' на \'Первое\nзначение\''                                                    | 'Success' |
		| 'И я меняю значение переключателя с именем \'РеквизитПереключательВысотаСтроки2\' на \'Второе\nзначение\''                                                    | 'Success' |
		| 'И я изменяю флаг с именем \'РеквизитЧисло1\''                                                                                                                | 'Success' |
		| 'И В текущем окне я нажимаю кнопку командного интерфейса \'Общая команда для справочника1\''                                                                  | 'Success' |
		| 'И В текущем окне я нажимаю кнопку командного интерфейса \'Основное\''                                                                                        | 'Success' |
		| '*Работа с таблицами'                                                                                                                                         | ''        |
		| 'И я перехожу к закладке с именем "СтраницаТЧ"'                                                                                                               | 'Success' |
		| 'И я фиксирую группу с именем "СтраницаТЧ"'                                                                                                                   | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" я нажимаю на кнопку с именем \'ТабличнаяЧасть1Добавить\''                                                                      | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" в поле с именем \'ТабличнаяЧасть1РеквизитЧисло\' я ввожу текст \'111,00\''                                                     | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" я активизирую поле с именем "ТабличнаяЧасть1РеквизитСтрока"'                                                                   | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" в поле с именем \'ТабличнаяЧасть1РеквизитСтрока\' я ввожу текст \'СтрокаТЧ\''                                                  | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" я активизирую поле с именем "ТабличнаяЧасть1РеквизитДата"'                                                                     | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" в поле с именем \'ТабличнаяЧасть1РеквизитДата\' я ввожу текст \'08.04.1981\''                                                  | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" я активизирую поле с именем "ТабличнаяЧасть1РеквизитСправочник"'                                                               | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" я нажимаю кнопку выбора у реквизита с именем "ТабличнаяЧасть1РеквизитСправочник"'                                              | 'Success' |
		| 'Тогда открылось окно \'Справочник2\''                                                                                                                        | 'Success' |
		| 'И в таблице "Список" я перехожу к строке:'                                                                                                                   | 'Success' |
		| '\| \'Наименование\'      \|'                                                                                                                                 | ''        |
		| '\| \'ТестовыйЭлемент21\' \|'                                                                                                                                 | ''        |
		| 'И в таблице "Список" я выбираю текущую строку'                                                                                                               | 'Success' |
		| 'Тогда открылось окно \'Справочник1 (соз*\''                                                                                                                  | 'Success' |
		| 'И В таблице "ТабличнаяЧасть1" я нажимаю кнопку очистить у поля с именем "ТабличнаяЧасть1РеквизитСправочник"'                                                 | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" из выпадающего списка с именем "ТабличнаяЧасть1РеквизитЧислоПеречисление" я выбираю точное значение \'ЗначениеПеречисления1\'' | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" из выпадающего списка с именем "ТабличнаяЧасть1РеквизитЧислоПеречисление" я выбираю точное значение \'ЗначениеПеречисления2\'' | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки'                                                                                              | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" я активизирую поле с именем "ТабличнаяЧасть1РеквизитБулево"'                                                                   | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" я изменяю флаг с именем \'ТабличнаяЧасть1РеквизитБулево\''                                                                     | 'Success' |
		| 'И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки'                                                                                              | 'Success' |
		| '*Создание нового элемента'                                                                                                                                   | ''        |
		| 'И я перехожу к закладке с именем "Группа1"'                                                                                                                  | 'Success' |
		| 'И я фиксирую группу с именем "Группа1"'                                                                                                                      | 'Success' |
		| 'И я нажимаю на кнопку создать поля с именем "Реквизит4"'                                                                                                     | 'Success' |
		| 'Тогда открылось окно \'Справочник2 (создание)\''                                                                                                             | 'Success' |
		| 'И в поле с именем \'Наименование\' я ввожу текст \'111\''                                                                                                    | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ФормаЗаписатьИЗакрыть\''                                                                                                    | 'Success' |
		| 'И я жду закрытия окна \'Справочник2 (создание) *\' в течение 20 секунд'                                                                                      | 'Success' |
		| '*Работа с группами'                                                                                                                                          | ''        |
		| 'И я перехожу к закладке с именем "Группа4"'                                                                                                                  | 'Success' |
		| 'И я фиксирую группу с именем "Группа4"'                                                                                                                      | 'Success' |
		| 'И я сворачиваю группу с именем "СворачиваемаяГруппа"'                                                                                                        | 'Success' |
		| 'И я нажимаю кнопку выбора у поля с именем "СоставнойРеквизит"'                                                                                               | 'Success' |
		| 'Тогда открылось окно \'Выбор типа данных\''                                                                                                                  | 'Success' |
		| 'И в таблице "" я перехожу к строке:'                                                                                                                         | 'Success' |
		| '\| \'\'            \|'                                                                                                                                       | ''        |
		| '\| \'Справочник3\' \|'                                                                                                                                       | ''        |
		| 'И Пауза 1'                                                                                                                                                   | 'Success' |
		| 'И я нажимаю на кнопку \'ОК\''                                                                                                                                | 'Success' |
		| 'Тогда открылось окно \'Справочник3\''                                                                                                                        | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ФормаВыбрать\''                                                                                                             | 'Success' |
		| 'И я фиксирую группу с именем "Группа4"'                                                                                                                      | 'Success' |
		| 'И я разворачиваю группу с именем "СворачиваемаяГруппа"'                                                                                                      | 'Success' |
		| 'И я нажимаю на гиперссылку с именем "Наименование2"'                                                                                                         | 'Success' |
		| 'Тогда открылось окно \'1С:Предприятие\''                                                                                                                     | 'Success' |
		| 'И я нажимаю на кнопку \'OK\''                                                                                                                                | 'Success' |
		| 'Тогда открылось окно \'Справочник1 (*\''                                                                                                                     | 'Success' |
		| 'И я фиксирую группу с именем "Группа4"'                                                                                                                      | 'Success' |
		| 'И у поля с именем "НадписьФорматированнаяСтрока" я нажимаю гиперссылку \'Ссылка1\''                                                                          | 'Success' |
		| 'И у поля с именем "НадписьФорматированнаяСтрока" я нажимаю гиперссылку \'Ссылка2\''                                                                          | 'Success' |
		| 'И пауза 1'                                                                                                                                                   | 'Success' |
		| 'И я очищаю окно сообщений пользователю'                                                                                                                      | 'Success' |
		| '*Работа с кнопками формы'                                                                                                                                    | ''        |
		| 'И я перехожу к закладке с именем "Группа2ПроверкаКнопок"'                                                                                                    | 'Success' |
		| 'И я фиксирую группу с именем "Группа2ПроверкаКнопок"'                                                                                                        | 'Success' |
		| 'И я меняю значение переключателя с именем \'Переключатель\' на \'Первое значение\''                                                                          | 'Success' |
		| 'И я меняю значение переключателя с именем \'Переключатель\' на \'Второе значение\''                                                                          | 'Success' |
		| 'И я меняю значение переключателя с именем \'Переключатель\' на \'Третье значение\''                                                                          | 'Success' |
		| 'И у поля с именем "НадписьСсылки" я нажимаю гиперссылку \'Первая ссылка\''                                                                                   | 'Success' |
		| 'Тогда появилось предупреждение, содержащее текст "ТекстОдин"'                                                                                                | 'Success' |
		| 'И я нажимаю на кнопку \'OK\''                                                                                                                                | 'Success' |
		| 'И у поля с именем "НадписьСсылки" я нажимаю гиперссылку \'Вторая ссылка\''                                                                                   | 'Success' |
		| 'Тогда появилось предупреждение, содержащее текст "ТекстДва"'                                                                                                 | 'Success' |
		| 'И я нажимаю на кнопку \'OK\''                                                                                                                                | 'Success' |
		| 'И я нажимаю на гиперссылку с именем "ГиперссылкаТолькоПросмотр2"'                                                                                            | 'Success' |
		| 'И я нажимаю на кнопку с именем \'КнопкаГиперссылка\''                                                                                                        | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ЗаполнитьРекСтрока1\''                                                                                                      | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ВывестиПредупреждение\''                                                                                                    | 'Success' |
		| 'Тогда открылось окно \'1С:Предприятие\''                                                                                                                     | 'Success' |
		| 'И я нажимаю на кнопку \'OK\''                                                                                                                                | 'Success' |
		| 'И я нажимаю на кнопку с именем \'КнопкаСЗаголовокомСПереносомСтроки\''                                                                                       | 'Success' |
		| 'Тогда в логе сообщений TestClient есть строки:'                                                                                                              | 'Success' |
		| '\| \'КнопкаСЗаголовокомСПереносомСтроки\' \|'                                                                                                                | ''        |
		| 'И я очищаю окно сообщений пользователю'                                                                                                                      | 'Success' |
		| '*Кнопка ещё'                                                                                                                                                 | ''        |
		| 'И я нажимаю на кнопку с именем \'ФормаПеречитать\''                                                                                                          | 'Success' |
		| '*Запись элемента справочника'                                                                                                                                | ''        |
		| 'И я нажимаю на кнопку с именем \'ФормаЗаписатьИЗакрыть\''                                                                                                    | 'Success' |
		| 'И я жду закрытия окна \'Справочник1 (создание) *\' в течение 20 секунд'                                                                                      | 'Success' |
		| '* Нажатие на кнопку режима просмотра списка'                                                                                                                 | ''        |
		| 'И я закрываю все окна клиентского приложения'                                                                                                                | 'Success' |
		| 'И В командном интерфейсе я выбираю \'Основная\' \'Справочник1\''                                                                                             | 'Success' |
		| 'Тогда открылось окно \'Справочник1\''                                                                                                                        | 'Success' |
		| 'И я нажимаю на кнопку с именем \'ФормаСписок\''                                                                                                              | 'Success' |
	
		
		

	И я перехожу к закладке с именем "ГруппаСлужебная"
	И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ЗакрытьПодключенныйTestClient/ЗакрытьПодключенныйTestClient"
	
	И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient
	И Я нажимаю на кнопку выполнить сценарии в Vanessa-Automation TestClient


Сценарий: Активизация основного клиента
	И я закрываю TestClient "TM"
	И в таблице клиентов тестирования я активизирую строку 'Этот клиент'




