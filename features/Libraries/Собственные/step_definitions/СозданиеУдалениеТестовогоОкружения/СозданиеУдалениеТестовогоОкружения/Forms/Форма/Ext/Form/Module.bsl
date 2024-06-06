﻿//начало текста модуля

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
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"СоздаюТестовоеОкружениеИзМакета(Парам01)","СоздаюТестовоеОкружениеИзМакета","Дано создаю тестовое окружение из макета ""Данные""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"УдаляюТестовоеОкружение()","УдаляюТестовоеОкружение","И удаляю тестовое окружение");

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
	Ванесса.Шаг("Тогда удаляю тестовое окружение")
КонецПроцедуры

///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Дано создаю тестовое окружение из макета "Данные"
//@СоздаюТестовоеОкружениеИзМакета(Парам01)
Процедура СоздаюТестовоеОкружениеИзМакета(ИмяМакета) Экспорт
	
	Перем ТестовоеОкружение;
	
	Попытка
		Макет = Ванесса.ПолучитьМакетОбработки(ИмяМакета);
		Данные = Ванесса.СоздатьДанныеПоТабличномуДокументу(Макет);
	Исключение
		Ошибка =  СокрЛП(ОписаниеОшибки());
		ВызватьИсключение "Шаг выполнен с ошибкой: " + СокрЛП(Ошибка);
	КонецПопытки;
	
	Если Не КонтекстСохраняемый.Свойство("ТестовоеОкружение", ТестовоеОкружение) Тогда
		ТестовоеОкружение = Новый Структура;
	КонецЕсли;
	
	ДополнитьСтруктуруНаСервере(ТестовоеОкружение, Данные);
	КонтекстСохраняемый.Вставить(КлючДанныхДляСохраненияНаСервере(), ТестовоеОкружение);
	
КонецПроцедуры

&НаКлиенте
//И удаляю тестовое окружение
//@ЯУдаляюТестовоеОкружение()
Процедура УдаляюТестовоеОкружение() Экспорт
	
	Перем ЗначениеДанных;
	
	КлючДанных = КлючДанныхДляСохраненияНаСервере();
	
	Если КонтекстСохраняемый.Свойство(КлючДанных, ЗначениеДанных) Тогда
		Ванесса.ПроверитьНеРавенство(УдалитьСозданныеДанныеНаСервере(ЗначениеДанных), 0, "Удалили тестовое окружение");
		КонтекстСохраняемый.Удалить(КлючДанных);
	КонецЕсли;
	
КонецПроцедуры

///////////////////////////////////////////////////
//Служебные процедуры и функции
///////////////////////////////////////////////////

&НаСервере
Функция УдалитьСозданныеДанныеНаСервере(Знач ТестовоеОкружение)
	
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
	Возврат ОбработкаОбъект.УдалитьСозданныеДанные(ТестовоеОкружение);
	
КонецФункции

&НаСервере
Функция ПолучитьДанныеДляПомещенияВКонтекстНаСервере(Знач Макет)
	
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
	Возврат ОбработкаОбъект.ПолучитьДанныеДляПомещенияВКонтекст(Макет);
	
КонецФункции

&НаСервере
Процедура ДополнитьСтруктуруНаСервере(СтруктураПриемник, Знач СтруктураИсточник)
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
	ОбработкаОбъект.ДополнитьСтруктуру(СтруктураПриемник, СтруктураИсточник);
КонецПроцедуры

&НаСервере
Функция КлючДанныхДляСохраненияНаСервере()
	
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
	Возврат ОбработкаОбъект.КлючДанныхДляСохранения();
	
КонецФункции

//окончание текста модуля
