﻿# language: ru
# encoding: utf-8
#parent uf:
@UF9_Вспомогательные_фичи
#parent ua:
@UA42_Тестовые_фичи

@IgnoreOnCIMainBuild


Функциональность: ФичаДляПроверкиОтчетаAllure42

	
 
Сценарий: ФичаДляПроверкиОтчетаAllure42
	И я выполняю код встроенного языка
	"""bsl
		Если Не КонтекстСохраняемый.Свойство("ГлобальнаяПеременнаяПроверкаКонтекста") Тогда
			КонтекстСохраняемый.Вставить("ГлобальнаяПеременнаяПроверкаКонтекста", 0);
		КонецЕсли;
		КонтекстСохраняемый.Вставить("ГлобальнаяПеременнаяПроверкаКонтекста", КонтекстСохраняемый.ГлобальнаяПеременнаяПроверкаКонтекста + 1);
	"""
	
	И я выполняю код встроенного языка
	"""bsl
		Если Не КонтекстСохраняемый.Свойство("ГлобальнаяПеременная1") Тогда
			КонтекстСохраняемый.Вставить("ГлобальнаяПеременная1", 0);
		КонецЕсли;
		КонтекстСохраняемый.Вставить("ГлобальнаяПеременная1", КонтекстСохраняемый.ГлобальнаяПеременная1 + 1);
	"""
	
	И я выполняю код встроенного языка
	"""bsl
		Если КонтекстСохраняемый.ГлобальнаяПеременная1 <= 2 Тогда
			ВызватьИсключение "Ошибка";
		КонецЕсли;
	"""
