﻿# language: ru
# encoding: utf-8
#parent uf:
@UF11_Прочее
#parent ua:
@UA44_Прочая_активность_по_проверке

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb
@IgnoreOn836
@IgnoreOn837
@IgnoreOn838
@IgnoreOn839
@IgnoreOn8310
@IgnoreOn8311
@IgnoreOn8312
@IgnoreOn8313
@IgnoreOn8314
@IgnoreOn8315
@IgnoreOn8316
@IgnoreOn8317
@IgnoreOn8318
@IgnoreOn8319
@IgnoreOn8320
@IgnoreOn8321
@IgnoreOn8322

@tree

Функционал: Проверка поля с множественным значением. Начиная с 8.3.23
 
 
 

Сценарий: Проверка поля с множественным значением. Начиная с 8.3.23

	* Создание двух элементов справочника
		Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
		И я закрываю все окна клиентского приложения

		Дано я удаляю все элементы Справочника "Справочник1"
		И В командном интерфейсе я выбираю 'Основная' 'Справочник1'
		Тогда открылось окно 'Справочник1'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Справочник1 (создание)'
		И в поле с именем 'Наименование' я ввожу текст '111'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Справочник1 (создание) *' в течение 20 секунд
		Тогда открылось окно 'Справочник1'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Справочник1 (создание)'
		И в поле с именем 'Наименование' я ввожу текст '222'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Справочник1 (создание) *' в течение 20 секунд

	* Создание ещё одного элемента. В нём заполняется поле с множественным выбором
		Когда открылось окно 'Справочник1'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Справочник1 (создание)'
		И в поле с именем 'Наименование' я ввожу текст '333'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно '* (Справочник1)'
		И я нажимаю кнопку выбора у поля с именем "СписокМножественныйВыбор"
		Когда открылось окно 'Список значений'
		И я нажимаю на кнопку с именем 'Add'
		И в таблице "ValueList" из выпадающего списка с именем "Value" я выбираю по строке '111'
		И в таблице "ValueList" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Add'
		И в таблице "ValueList" из выпадающего списка с именем "Value" я выбираю по строке '222'
		И в таблице "ValueList" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'OK'
				
				
	* Проверка значения поля
		И элемент формы с именем 'СписокМножественныйВыбор' стал равен '111; 222'
		И я нажимаю на кнопку с именем 'СписокМножественныйВыборИзменитьТолькоПросмотр'
		И Пауза 0.1
		И элемент формы с именем 'СписокМножественныйВыбор' стал равен '111; 222'
		И я нажимаю на кнопку с именем 'СписокМножественныйВыборИзменитьТолькоПросмотр'
		И я нажимаю на кнопку с именем 'СписокМножественныйВыборИзменитьДоступность'
		И Пауза 0.1
		И элемент формы с именем 'СписокМножественныйВыбор' стал равен '111; 222'
		
						