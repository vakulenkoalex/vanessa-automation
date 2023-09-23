﻿# language: ru
# encoding: utf-8
#parent uf:
@UF9_Вспомогательные_фичи
#parent ua:
@UA30_Прочие_макеты

@IgnoreOnCIMainBuild
@tree

Функциональность: Переменные08
 

 
Сценарий: Переменные08
	И Я запоминаю значение выражения '"ПромСтрока1"' в переменную "ИмяПеременной1"
	И я удаляю переменную 'ИмяПеременной2Глобальная'
	И Я запоминаю значение выражения '"ПромСтрока2"' в переменную "$$ИмяПеременной2Глобальная$$"
	
	И я выполняю код встроенного языка на сервере с передачей переменных
	"""bsl
		Сообщить("1. КаталогИнструментов1 = $КаталогИнструментов$");
		Сообщить("2. ИмяПеременной2 = " + Контекст.ИмяПеременной1);
		Сообщить("3. ИмяПеременной3 = $ИмяПеременной1$");
		Сообщить("4. ИмяПеременной4 = $$ИмяПеременной2Глобальная$$");
		Сообщить("5. ИмяПеременной5 = " + КонтекстСохраняемый.ИмяПеременной2Глобальная);
		Контекст.ИмяПеременной1 = "Новое значение 1";
		КонтекстСохраняемый.ИмяПеременной2Глобальная = "Новое значение 2";
	"""
	И я вывожу значение переменной "ИмяПеременной1"
	И я вывожу значение переменной "ИмяПеременной2Глобальная"
	

	И я выполняю код встроенного языка на сервере без контекста с передачей переменных
	"""bsl
		Сообщить("6. КаталогИнструментов11 = $КаталогИнструментов$");
		Сообщить("7. ИмяПеременной22 = " + Контекст.ИмяПеременной1);
		Сообщить("8. ИмяПеременной33 = $ИмяПеременной1$");
		Сообщить("9. ИмяПеременной44 = $$ИмяПеременной2Глобальная$$");
		Сообщить("10. ИмяПеременной55 = " + КонтекстСохраняемый.ИмяПеременной2Глобальная);
		Контекст.ИмяПеременной1 = "Новое значение 3";
		КонтекстСохраняемый.ИмяПеременной2Глобальная = "Новое значение 4";
	"""
		
	И я вывожу значение переменной "ИмяПеременной1"
	И я вывожу значение переменной "ИмяПеременной2Глобальная"
