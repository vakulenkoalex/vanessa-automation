﻿# language: ru
# encoding: utf-8
#parent uf:
@UF9_Вспомогательные_фичи
#parent ua:
@UA25_Макеты_для_отчетов_о_выполнении

@ExportScenarios
@IgnoreOnCIMainBuild


Функциональность: Я вызываю экспортный сценарий для проверки вставок подсценариев
 

Сценарий: Я вызываю экспортный сценарий для проверки вставок подсценариев

	И Я запоминаю значение выражения '1+1' в переменную "ИмяПеременной1"
	И Я вызываю экспортный сценарий для проверки вставок подсценариев вложенный
	
Сценарий: Я вызываю экспортный сценарий, который не вызывает исключение

	И я удаляю переменную 'ИмяПеременной1'
	И Я запоминаю значение выражения '1+1' в переменную "ИмяПеременной1"
	

Сценарий: Я вызваю исключение в подсценарии "ТекстИсключения"
	
	И я вызываю исключение "ТекстИсключения"
	

Сценарий: Я вызваю исключение в подсценарии "ТекстИсключения" уровень один
	
	И я вызываю исключение "ТекстИсключения" уровень два

	
Сценарий: Я вызваю шаг и исключение в подсценарии "ТекстИсключения"

	И я выполняю код встроенного языка
		| 'Сообщить("Hellow world 1.")' |	
	И я удаляю переменную 'ИмяПеременной1'
	И Я запоминаю значение выражения '1+1' в переменную "ИмяПеременной1"
	И я вызываю исключение "ТекстИсключения" уровень два
	
Сценарий: Я вызываю экспортный сценарий, который содержит условия
	И я удаляю переменную 'ИмяПеременной1'
	И Я запоминаю значение выражения '1+1' в переменную "ИмяПеременной1"
	Если "Истина" Тогда
		И Я запоминаю значение выражения '2+2' в переменную "ИмяПеременной2"
	Если "Ложь" Тогда
		И Я запоминаю значение выражения '3+3' в переменную "ИмяПеременной3"
	Если "Истина" Тогда
		И Я запоминаю значение выражения '4+4' в переменную "ИмяПеременной4"
	Если "Ложь" Тогда
		И Я запоминаю значение выражения '5+5' в переменную "ИмяПеременной5"
