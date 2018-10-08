﻿
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОчищаюКаталог(Парам01)","ЯОчищаюКаталог","И я очищаю каталог ""ИмяКаталога""","Очищает указанный каталог","Файлы");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСоздаюКаталог(Парам01)","ЯСоздаюКаталог","И я создаю каталог ""ИмяКаталога""","Создает каталог с указанным именем, если его нет, а также все его подкаталоги.","Файлы");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ФайлНеСодержитСтроки(Парам01,ТабПарам)","ФайлНеСодержитСтроки","И файл ""ИмяФайла"" не содержит строки" + Символы.ПС + Символы.Таб + "|""ПодСтрока1""|" + Символы.ПС + Символы.Таб + "|""ПодСтрока2""|","Проверяет, что файле нет указанных строк/подстрок.","Файлы");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ФайлСодержитСтроки(Парам01,ТабПарам)"  ,"ФайлСодержитСтроки"  ,"И файл ""ИмяФайла"" содержит строки"    + Символы.ПС + Символы.Таб + "|""ПодСтрока1""|" + Символы.ПС + Символы.Таб + "|""ПодСтрока2""|","Проверяет, что файле есть указанные строки/подстроки.","Файлы");
	
	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//И я очищаю каталог "ИмяКаталога"
//@ЯОчищаюКаталог(Парам01)
Процедура ЯОчищаюКаталог(Знач ИмяКаталога) Экспорт
	ИмяКаталога = Ванесса.ПолучитьЗначениеИзКонтекстаЕслиЭтоВозможно(ИмяКаталога);
	Если Не Ванесса.ФайлСуществуетКомандаСистемы(ИмяКаталога) Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Каталог <%1> не найден.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ИмяКаталога); 
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	
	Ванесса.ОчиститьСодержимоеКаталога(ИмяКаталога);
КонецПроцедуры

&НаКлиенте
//И я создаю каталог "ИмяКаталога"
//@ЯСоздаюКаталог(Парам01)
Процедура ЯСоздаюКаталог(Знач ИмяКаталога) Экспорт
	ИмяКаталога = Ванесса.ПолучитьЗначениеИзКонтекстаЕслиЭтоВозможно(ИмяКаталога);
	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяКаталога) Тогда
		Возврат;
	КонецЕсли;	 
	
	Массив = Новый Массив;
	Массив.Добавить(ИмяКаталога);
	
	Файл = Новый Файл(ИмяКаталога);
	ТекРодитель = Файл.Путь;
	Пока Истина Цикл
		Если Не ЗначениеЗаполнено(ТекРодитель) Тогда
			Прервать;
		КонецЕсли;	 
		
		Массив.Добавить(ТекРодитель);
		
		Файл = Новый Файл(ТекРодитель);
		
		Если НРег(ТекРодитель) = НРег(Файл.Путь) Тогда
			Прервать;
		КонецЕсли;	 
		
		ТекРодитель = Файл.Путь;
	КонецЦикла;	
	
	Для Ккк = 0 По Массив.Количество()-1 Цикл
		ТекРодитель = Массив[Массив.Количество()-1-Ккк];
		Если Не Ванесса.ФайлСуществуетКомандаСистемы(ТекРодитель) Тогда
			Ванесса.СоздатьКаталогКомандаСистемы(ТекРодитель);
		КонецЕсли;	 
	КонецЦикла;	
	
	
	Ванесса.СоздатьКаталогКомандаСистемы(ИмяКаталога);
КонецПроцедуры


&НаКлиенте
//И файл "ИмяФайла" не содержит строки
//@ФайлНеСодержитСтроки(Парам01,ТабПарам)
Процедура ФайлНеСодержитСтроки(Знач ИмяФайла,ТабПарам) Экспорт
	ИмяФайла = Ванесса.ПолучитьЗначениеИзКонтекстаЕслиЭтоВозможно(ИмяФайла);
	
	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ИмяФайла,"UTF-8");
	
	Ошибки = Новый Массив;
	Пока Истина Цикл
		Стр = Текст.ПрочитатьСтроку();
		Если Стр = Неопределено Тогда
			Прервать;
		КонецЕсли;	 
		
		Стр = НРег(Стр);
		
		Для Каждого СтрокаТабПарам Из ТабПарам Цикл
			ИскомаяПодстрока = НРег(СтрокаТабПарам.Кол1);
			Если Найти(Стр,ИскомаяПодстрока) > 0 Тогда
				
				Если Ошибки.Найти(СтрокаТабПарам.Кол1) = Неопределено Тогда
					Ошибки.Добавить(СтрокаТабПарам.Кол1);
				КонецЕсли;	 
			КонецЕсли;	 
		КонецЦикла;
	КонецЦикла;	
	Текст.Закрыть();
	
	Если Ошибки.Количество() > 0 Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("В файле <%1> нашли строки, а ожидали, что их нет:%2");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ИмяФайла); 
		
		СтрокаОшибки = "";
		Для Каждого Стр Из Ошибки Цикл
			СтрокаОшибки = СтрокаОшибки + Символы.ПС + Стр;
		КонецЦикла;	
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%2",СтрокаОшибки); 
		
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
КонецПроцедуры

&НаКлиенте
//И файл "ИмяФайла" содержит строки
//@ФайлСодержитСтроки(Парам01,ТабПарам)
Процедура ФайлСодержитСтроки(Знач ИмяФайла,ТабПарам) Экспорт
	ИмяФайла = Ванесса.ПолучитьЗначениеИзКонтекстаЕслиЭтоВозможно(ИмяФайла);
	
	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ИмяФайла,"UTF-8");
	
	СтрокиДляПоиска = Новый Массив;
	Для Каждого СтрокаТабПарам Из ТабПарам Цикл
		ИскомаяПодстрока = НРег(СтрокаТабПарам.Кол1);
		СтрокиДляПоиска.Добавить(Новый Структура("Стр,Оригинал,Найдена",ИскомаяПодстрока,СтрокаТабПарам.Кол1,Ложь));
	КонецЦикла;
	
	Ошибки = Новый Массив;
	Пока Истина Цикл
		Стр = Текст.ПрочитатьСтроку();
		Если Стр = Неопределено Тогда
			Прервать;
		КонецЕсли;	 
		
		Стр = НРег(Стр);
		
		Для Каждого ДанныеДляПоиска Из СтрокиДляПоиска Цикл
			Если ДанныеДляПоиска.Найдена Тогда
				Продолжить;
			КонецЕсли;	 
			
			ИскомаяПодстрока = ДанныеДляПоиска.Стр;
			Если Найти(Стр,ИскомаяПодстрока) > 0 Тогда
				ДанныеДляПоиска.Найдена = Истина;
			КонецЕсли;	 
		КонецЦикла;
	КонецЦикла;	
	Текст.Закрыть();
	
	
	Для Каждого ДанныеДляПоиска Из СтрокиДляПоиска Цикл
		Если ДанныеДляПоиска.Найдена Тогда
			Продолжить;
		КонецЕсли;	 
		
		Ошибки.Добавить(ДанныеДляПоиска.Оригинал);
	КонецЦикла;	 
	
	Если Ошибки.Количество() > 0 Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("В файле <%1> не нашли строки, а ожидали, что они там есть:%2");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ИмяФайла); 
		
		СтрокаОшибки = "";
		Для Каждого Стр Из Ошибки Цикл
			СтрокаОшибки = СтрокаОшибки + Символы.ПС + Стр;
		КонецЦикла;	
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%2",СтрокаОшибки); 
		
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
КонецПроцедуры
