﻿#Область ОписаниеПеременных

&НаКлиенте
Перем Ванесса;

&НаКлиенте
Перем ТекЗначенияДляОткрытияВкладкиDiff;

#КонецОбласти

#Область ЭкспортныеПроцедурыИФункции

// Делает первичную инициализацию модуля.
&НаКлиенте
Функция ИнициализацияФормы(ВладелецФормы) Экспорт
	Ванесса = ВладелецФормы;
	КешОтступов = Новый Соответствие;
КонецФункции	 

// Обработчик при изменении проекта git
&НаКлиенте
Процедура ПриИзменениПроекта() Экспорт
	Если НЕ Ванесса.Объект.ИспользоватьКомпонентуVanessaExt Тогда
		Возврат;
	КонецЕсли;	
	
	Если НЕ Ванесса.ФайлСуществуетКомандаСистемы(Ванесса.ПутьКПапкеGit) Тогда
		Возврат;
	КонецЕсли;	
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ОкончаниеПоискаРепозитория", ЭтаФорма);
	Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingFind(ОписаниеОповещения, Ванесса.ПутьКПапкеGit);
КонецПроцедуры 

// Обработчик изменения способа отображения отличий в редакторе
&НаКлиенте
Процедура ВидОтображенияОтличийВРедактореПриИзменении() Экспорт
	УстановитьРежимОтображенияРазличийУТекущейВкладки();
КонецПроцедуры 

// Обработчик активизации строки дерева
&НаКлиенте
Процедура ДеревоGitПриАктивизацииСтроки() Экспорт
	ДоступностьКнопокGit(Истина);
	ТекущиеДанные = Ванесса.Элементы.ДеревоGit.ТекущиеДанные;
	Если ТекущиеДанные = Неопределено Тогда
		ДоступностьКнопокGit(Ложь);
		Возврат;
	КонецЕсли;	
	
	Если ПустаяСтрока(ТекущиеДанные.Статус) Тогда
		ДоступностьКнопокGit(Ложь);
		Возврат;
	КонецЕсли;	
	
	//ТекущиеДанные.ПолучитьРодителя().Тип
	УзелДерева = ТекущиеДанные.ПолучитьРодителя();
	Если УзелДерева = Неопределено Тогда
		ДоступностьКнопокGit(Ложь);
	Иначе
		Если НРег(УзелДерева.Тип) = "staged" Тогда
			Ванесса.Элементы.ДеревоGitДобавитьВИндекс.Доступность = Ложь;
			Ванесса.Элементы.ДеревоGitДеревоGitУбратьИзИндекса.Доступность = Истина;
		ИначеЕсли НРег(УзелДерева.Тип) = "unstaged" Тогда
			Ванесса.Элементы.ДеревоGitДобавитьВИндекс.Доступность = Истина;
			Ванесса.Элементы.ДеревоGitДеревоGitУбратьИзИндекса.Доступность = Ложь;
		КонецЕсли;	 
	КонецЕсли;	 
	
	Если ТекущиеДанные.Статус = "DELETED" Тогда
		Если ТипЗнч(ТекущиеДанные.ДанныеФайла) <> Тип("Структура") Тогда
			Возврат;
		КонецЕсли;	 
		Если НЕ ПустаяСтрока(ТекущиеДанные.ДанныеФайла.old_id) Тогда
			ОписаниеОповещения = Новый ОписаниеОповещения("ОкончаниеReadingDeleted", ЭтаФорма, ТекущиеДанные.ДанныеФайла);
			Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingBlob(ОписаниеОповещения, ТекущиеДанные.ДанныеФайла.old_id, 0);
		КонецЕсли;
	Иначе	
		Если ТипЗнч(ТекущиеДанные.ДанныеФайла) <> Тип("Структура") Тогда
			Возврат;
		КонецЕсли;	 
		
		ДанныеФайла = ТекущиеДанные.ДанныеФайла;
		
		Если ДанныеФайла.Свойство("new_id") И НЕ ПустаяСтрока(ДанныеФайла.new_id) Тогда
			ОписаниеОповещения = Новый ОписаниеОповещения("ОкончаниеCallingBlob", ЭтаФорма, ТекущиеДанные.ДанныеФайла);
			Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingBlob(ОписаниеОповещения, ТекущиеДанные.ДанныеФайла.new_id, 0);
		Иначе
			ДанныеФайла.Вставить("new_id", "");
			ИмяФайла = Ванесса.ДополнитьСлешВПуть(Ванесса.ПутьКПапкеGit) + ДанныеФайла.new_name;
			ДвоичныеДанные = Новый ДвоичныеДанные(ИмяФайла);
			ДанныеФайла.Вставить("ДвоичныеДанные", ДвоичныеДанные);
			ОписаниеОповещения = Новый ОписаниеОповещения("ОкончаниеDiffFile", ЭтаФорма, ДанныеФайла);
			Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingIsBinary(ОписаниеОповещения, ДвоичныеДанные);
		КонецЕсли;	 
	КонецЕсли;	 
	
КонецПроцедуры 

// Закрывает все вкладки показывающие сравнение файлов
&НаКлиенте
Процедура ЗакрытьВсеВкладкиDiff() Экспорт
	VanessaTabs = Ванесса.VanessaTabs;
	МассивИД = Новый Массив;
	Для Сч = 0 По VanessaTabs.tabStack.length - 1 Цикл
		Если Ванесса.ЭтоВкладкаDiff(VanessaTabs.tabStack[Сч]) Тогда
			МассивИД.Добавить(VanessaTabs.tabStack[Сч]);
		КонецЕсли;	 
	КонецЦикла;	
	Для Каждого Вкладка Из МассивИД Цикл
		Вкладка.close();
	КонецЦикла;	 
КонецПроцедуры 

// Обработка события Добавить в индекс
&НаКлиенте
Процедура ДеревоGitДобавитьВИндекс() Экспорт
	ДеревоGitЭлементы = Ванесса.Элементы.ДеревоGit;
	Если ДеревоGitЭлементы.ВыделенныеСтроки = Неопределено Тогда
		Возврат;
	КонецЕсли;	 
	Если ДеревоGitЭлементы.ВыделенныеСтроки.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;
	
	ДобавитьМассив = Новый Массив;
	УдалитьМассив = Новый Массив;
	Для Каждого ИД In ДеревоGitЭлементы.ВыделенныеСтроки Цикл
		СтрокаДерева = Ванесса.ДеревоGit.НайтиПоИдентификатору(ИД);
		ДанныеФайла = СтрокаДерева.ДанныеФайла;
		Если НЕ ПустаяСтрока(ДанныеФайла.new_name) Тогда
			Если ДанныеФайла.status = "DELETED" Тогда
				УдалитьМассив.Добавить(ДанныеФайла.new_name);
			Иначе
				ДобавитьМассив.Добавить(ДанныеФайла.new_name);
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	
	ИмяФайлаДляАктивации = ДеревоGitЭлементы.ТекущиеДанные.Файл;
	ДопПараметры = Новый Структура;
	ДопПараметры.Вставить("ИмяФайлаДляАктивации", ИмяФайлаДляАктивации);
	Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingAdd(ПолучитьОповещениеИндекса(ДопПараметры),
		Ванесса.ЗаписатьОбъектJSON(ДобавитьМассив),
		Ванесса.ЗаписатьОбъектJSON(УдалитьМассив));
	
КонецПроцедуры 

// Обработка события удаления из индекса
&НаКлиенте
Процедура ДеревоGitДобавитьУбратьИзИндекса() Экспорт
	ДеревоGitЭлементы = Ванесса.Элементы.ДеревоGit;
	Если ДеревоGitЭлементы.ВыделенныеСтроки = Неопределено Тогда
		Возврат;
	КонецЕсли;	 
	Если ДеревоGitЭлементы.ВыделенныеСтроки.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;
	
	УдалитьМассив = Новый Массив;
	Для Каждого ИД In ДеревоGitЭлементы.ВыделенныеСтроки Цикл
		СтрокаДерева = Ванесса.ДеревоGit.НайтиПоИдентификатору(ИД);
		ДанныеФайла = СтрокаДерева.ДанныеФайла;
		Если НЕ ПустаяСтрока(ДанныеФайла.new_name) Тогда
			УдалитьМассив.Добавить(ДанныеФайла.new_name);
		КонецЕсли;
	КонецЦикла;
	
	ИмяФайлаДляАктивации = ДеревоGitЭлементы.ТекущиеДанные.Файл;
	ДопПараметры = Новый Структура;
	ДопПараметры.Вставить("ИмяФайлаДляАктивации", ИмяФайлаДляАктивации);
	Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingReset(ПолучитьОповещениеИндекса(ДопПараметры), Ванесса.ЗаписатьОбъектJSON(УдалитьМассив));
КонецПроцедуры 

// Обработка фиксации изменений
&НаКлиенте
Процедура ДеревоGitЗафиксировать() Экспорт
	Если ПустаяСтрока(Ванесса.ДеревоGitДеревоТекстСообщения) Тогда
		Ванесса.СообщитьПользователю(Ванесса.Локализовать("Не указан текст коммита."));
		Возврат;
	КонецЕсли;	 
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ПередCallingCommit", ЭтаФорма);
	Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingStatus(ОписаниеОповещения);
	
КонецПроцедуры 

// Открытие формы настроек
&НаКлиенте
Процедура ДеревоGitНастройки() Экспорт
	Если НЕ Ванесса.Объект.ИспользоватьКомпонентуVanessaExt Тогда
		Ванесса.СообщитьПользователю(Ванесса.Локализовать("Необходимо включить использование внешней компоненты VanessaExt."));
		Возврат;
	КонецЕсли;	 
	
	ПараметрыФормы = Новый Структура;
	ОткрытьФорму(Ванесса.ПолучитьИмяОбработкиVA() + ".Форма.НастройкиGit", ПараметрыФормы, Ванесса);
КонецПроцедуры 

// Обработка выбора ветки
&НаКлиенте
Процедура ДеревоGitВыборВетки() Экспорт
	Если НЕ Ванесса.Объект.ИспользоватьКомпонентуVanessaExt Тогда
		Ванесса.СообщитьПользователю(Ванесса.Локализовать("Необходимо включить использование внешней компоненты VanessaExt."));
		Возврат;
	КонецЕсли;	 
	ОписаниеОповещения = Новый ОписаниеОповещения("ПослеПолученияВетки", ЭтаФорма);
	Ванесса.ВнешняяКомпонентаРаботаСGit.BeginGettingBranches(ОписаниеОповещения);
КонецПроцедуры 

// Обработка нажатия кнопки Pull
&НаКлиенте
Процедура ДеревоGitPull() Экспорт
	СтрокаКоманды = "
	|cd /d ""%1""
	|git pull > ""%2""  2>&1 ";
	
	ФайлВыводКонсоли = ПолучитьИмяВременногоФайла("txt");
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды, "%1", Ванесса.ПутьКПапкеGit);
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды, "%2", ФайлВыводКонсоли);
	
	Ванесса.ВыполнитьКомандуОСБезПоказаЧерногоОкна(СтрокаКоманды);
	
	Если Ванесса.ФайлСуществуетКомандаСистемы(ФайлВыводКонсоли) Тогда
		Текст = Новый ЧтениеТекста;
		Текст.Открыть(ФайлВыводКонсоли,"UTF-8");
		ВыводКонсоли = Текст.Прочитать();
		Текст.Закрыть();
		
		Ванесса.СообщитьПользователю(ВыводКонсоли);
	КонецЕсли;	 
КонецПроцедуры 

// Обработка нажатия кнопки Push
&НаКлиенте
Процедура ДеревоGitPush() Экспорт
	СтрокаКоманды = "
	|cd /d ""%1""
	|git push > ""%2""  2>&1 ";
	
	ФайлВыводКонсоли = ПолучитьИмяВременногоФайла("txt");
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды, "%1", Ванесса.ПутьКПапкеGit);
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды, "%2", ФайлВыводКонсоли);
	
	Ванесса.ВыполнитьКомандуОСБезПоказаЧерногоОкна(СтрокаКоманды);
	
	Если Ванесса.ФайлСуществуетКомандаСистемы(ФайлВыводКонсоли) Тогда
		Текст = Новый ЧтениеТекста;
		Текст.Открыть(ФайлВыводКонсоли,"UTF-8");
		ВыводКонсоли = Текст.Прочитать();
		Текст.Закрыть();
		
		Ванесса.СообщитьПользователю(ВыводКонсоли);
	КонецЕсли;	 
КонецПроцедуры 

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПослеПолученияВетки(Значение, ДопПараметры) Экспорт
	
	Ванесса.ПослеПолученияВетки(Значение, ДопПараметры);
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеВыбораВетки(ВыбранныйЭлемент, ДопПараметры) Экспорт
	
	Если ВыбранныйЭлемент = Неопределено Тогда
		Возврат;
	ИначеЕсли ВыбранныйЭлемент.Значение = 1 Тогда
		Текст = Ванесса.Локализовать("Введите имя новой ветки");
		ОписаниеОповещения = Новый ОписаниеОповещения("ПослеВводаИмениВетки", ЭтаФорма);
		ПоказатьВводСтроки(ОписаниеОповещения, , Текст);
	Иначе
		ОписаниеОповещения = Новый ОписаниеОповещения("ПослеВызоваCheckout", ЭтаФорма);
		Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingCheckout(ОписаниеОповещения, ВыбранныйЭлемент.Значение);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеВводаИмениВетки(ИмяВетки, ДопПараметры) Экспорт
	
	Если НЕ ПустаяСтрока(ИмяВетки) Тогда
		ОписаниеОповещения = Новый ОписаниеОповещения("ПослеВызоваCheckout", ЭтаФорма);
		Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingCheckout(ОписаниеОповещения, ИмяВетки, True);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеВызоваCheckout(ResultCall, ParametersCall, ДопПараметры) Экспорт
	
	НачатьПолучениеСтатуса();
	
КонецПроцедуры

&НаКлиенте
Процедура ПередCallingCommit(Результат, ПараметрыВызова, ДопПараметры) Экспорт
	
	Массив = Неопределено;
	
	Данные = Ванесса.ПрочитатьОбъектJSON(Результат);
	Если Данные.success Тогда
		Если ТипЗнч(Данные.result) = Тип("Структура") Тогда
			Если Данные.result.Свойство("Index", Массив) И ТипЗнч(Массив) = Тип("Массив") Тогда
				Для Каждого Элем Из Массив Цикл
					ОписаниеОповещения = Новый ОписаниеОповещения("ОкончаниеCallingCommit", ЭтаФорма);
					Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingCommit(ОписаниеОповещения, Ванесса.ДеревоGitДеревоТекстСообщения);
					Возврат;
				КонецЦикла;
			КонецЕсли;
		КонецЕсли;
	КонецЕсли;
	
	Ванесса.СообщитьПользователю(Ванесса.Локализовать("Нет изменений для фиксации."));
	
КонецПроцедуры

&НаКлиенте
Процедура ОкончаниеCallingCommit(Результат, ПараметрыВызова, ДопПараметры) Экспорт
	
	Данные = Ванесса.ПрочитатьОбъектJSON(Результат);
	Если Данные.success Тогда
		Ванесса.ДеревоGitДеревоТекстСообщения = "";
		НачатьПолучениеСтатуса(Неопределено);
	ИначеЕсли Данные.error.code = 0 Тогда
		//SetCurrentPage(Items.InitPage);
	Иначе
		Ванесса.СообщитьПользователю(Ванесса.Локализовать(Данные.error.Message));
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Функция ПолучитьОповещениеИндекса(ДопПараметры)
	
	Возврат Новый ОписаниеОповещения("ОкончаниеCallingIndex", ЭтаФорма, ДопПараметры);
	
КонецФункции

&НаКлиенте
Процедура ОкончаниеCallingIndex(ResultCall, ParametersCall, ДопПараметры) Экспорт
	
	НачатьПолучениеСтатуса(ДопПараметры);
	
КонецПроцедуры

&НаКлиенте
Процедура ОкончаниеReadingDeleted(Результат, ПараметрыВызова, ДопПараметры) Экспорт
	
	ДвоичныеДанные = Результат;
	Кодировка = ПараметрыВызова[1];
	ДанныеФайла = ДопПараметры;
	
	Если Кодировка < 0 Тогда
		//SetEditorContent("binary", "", FileName, True);
	Иначе
		Если ТипЗнч(ДвоичныеДанные) = Тип("ДвоичныеДанные") Тогда
			ЧтениеТекста = Новый ЧтениеТекста(ДвоичныеДанные.ОткрытьПотокДляЧтения(), КодировкаТекста.UTF8);
			old_name = ДанныеФайла.old_name;
			new_name = ДанныеФайла.new_name;
			old_path = "blob:" + ДанныеФайла.old_id;
			new_id = "";
			new_path = ?(ПустаяСтрока(new_id), Ванесса.ДополнитьСлешВПуть(Ванесса.ПутьКПапкеGit) + new_name, "blob:" + new_id);
			
			УстановитьТекЗначенияДляОткрытияВкладкиDiff(ЧтениеТекста.Read(), old_name, old_path, "", new_name, new_path, new_name, Кодировка);
			ОткрытиеВкладкиDiff();
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ОткрытиеВкладкиDiff()
	Если Ванесса.VanessaTabs.tabStack.length = 0 Тогда
		ОткрытьВкладку = Истина;
	Иначе
		ОткрытьВкладку = НЕ Ванесса.ЭтоВкладкаDiff(Ванесса.VanessaTabs.current);
	КонецЕсли;	 
	
	Ванесса.VanessaTabs.diff(
	ТекЗначенияДляОткрытияВкладкиDiff.oldContent,
	ТекЗначенияДляОткрытияВкладкиDiff.oldFileName,
	ТекЗначенияДляОткрытияВкладкиDiff.oldFilePath,
	ТекЗначенияДляОткрытияВкладкиDiff.newContent,
	ТекЗначенияДляОткрытияВкладкиDiff.newFileName,
	ТекЗначенияДляОткрытияВкладкиDiff.newFilePath,
	ТекЗначенияДляОткрытияВкладкиDiff.title,
	ТекЗначенияДляОткрытияВкладкиDiff.encoding,
	Истина, ОткрытьВкладку);
	
	УстановитьРежимОтображенияРазличийУТекущейВкладки();
КонецПроцедуры 

&НаКлиенте
Процедура УстановитьТекЗначенияДляОткрытияВкладкиDiff(oldContent, oldFileName, oldFilePath, newContent, newFileName, newFilePath, title, encoding)
	ТекЗначенияДляОткрытияВкладкиDiff = Новый Структура;
	ТекЗначенияДляОткрытияВкладкиDiff.Вставить("oldContent", oldContent);
	ТекЗначенияДляОткрытияВкладкиDiff.Вставить("oldFileName", oldFileName);
	ТекЗначенияДляОткрытияВкладкиDiff.Вставить("oldFilePath", oldFilePath);
	ТекЗначенияДляОткрытияВкладкиDiff.Вставить("newContent", newContent);
	ТекЗначенияДляОткрытияВкладкиDiff.Вставить("newFileName", newFileName);
	ТекЗначенияДляОткрытияВкладкиDiff.Вставить("newFilePath", newFilePath);
	ТекЗначенияДляОткрытияВкладкиDiff.Вставить("title", title);
	ТекЗначенияДляОткрытияВкладкиDiff.Вставить("encoding", encoding);
КонецПроцедуры 

&НаКлиенте
Процедура УстановитьРежимОтображенияРазличийУТекущейВкладки()
	
	Если НЕ Ванесса.ЭтоВкладкаDiff(Ванесса.VanessaTabs.current) Тогда
		Возврат;
	КонецЕсли;	 
	
	Если Ванесса.Объект.ПоказыватьРазличияВРедактореОтдельно Тогда
		Ванесса.VanessaTabs.current.editor.setSideBySide(Истина);
	Иначе	
		Ванесса.VanessaTabs.current.editor.setSideBySide(Ложь);
	КонецЕсли;	 
	
КонецПроцедуры 

&НаКлиенте
Процедура ОкончаниеCallingBlob(Результат, ПараметрыВызова, ДопПараметры) Экспорт
	
	ДанныеФайла = ДопПараметры;
	ДанныеФайла.Вставить("ДвоичныеДанные", Результат);
	ДанныеФайла.Вставить("Кодировка", ПараметрыВызова[1]);
	ДанныеФайла.Вставить("ReadOnly", True);
	ОписаниеОповещения = Новый ОписаниеОповещения("ОкончаниеReadingDiff", ЭтаФорма, ДанныеФайла);
	Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingBlob(ОписаниеОповещения, ДанныеФайла.old_id, 0);
	
КонецПроцедуры

&НаКлиенте
Процедура ОкончаниеDiffFile(Результат, ПараметрыВызова, ДопПараметры) Экспорт
	
	ДанныеФайла = ДопПараметры;
	ДанныеФайла.Вставить("Кодировка", ПараметрыВызова[1]);
	ДанныеФайла.Вставить("ReadOnly", False);
	ОписаниеОповещения = Новый ОписаниеОповещения("ОкончаниеReadingDiff", ЭтаФорма, ДанныеФайла);
	Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingBlob(ОписаниеОповещения, ДанныеФайла.old_id, 0);
	
КонецПроцедуры

&НаКлиенте
Процедура ОкончаниеReadingDiff(Результат, ПараметрыВызова, ДопПараметры) Экспорт
	ReadOnly = Истина;
	
	ДвоичныеДанные = Результат;
	Кодировка = ПараметрыВызова[1];
	ДанныеФайла = ДопПараметры;
	
	Если Кодировка < 0 Тогда
		old_text = "binary";
		old_name = "";
	Иначе
		Если ТипЗнч(ДвоичныеДанные) = Тип("ДвоичныеДанные") Тогда
			ЧтениеТекста = Новый ЧтениеТекста(ДвоичныеДанные.ОткрытьПотокДляЧтения(), КодировкаТекста.UTF8);
			old_text = ЧтениеТекста.Прочитать();
			old_name = ДанныеФайла.old_name;
		Иначе
			new_text = "error";
			old_name = "";
		КонецЕсли;
	КонецЕсли;
	
	Если ДанныеФайла.Кодировка < 0 Тогда
		ReadOnly = true;
		new_text = "binary";
		new_name = "";
	Иначе
		Если ТипЗнч(ДанныеФайла.ДвоичныеДанные) = Тип("ДвоичныеДанные") Тогда
			ЧтениеТекста = Новый ЧтениеТекста(ДанныеФайла.ДвоичныеДанные.ОткрытьПотокДляЧтения(), КодировкаТекста.UTF8);
			new_text = ЧтениеТекста.Прочитать();
			new_name = ДанныеФайла.new_name;
			ReadOnly = ДанныеФайла.ReadOnly;
		Иначе
			new_text = "error";
			new_name = "";
			ReadOnly = true;
		КонецЕсли;
	КонецЕсли;
	
	old_path = "blob:" + ДанныеФайла.old_id;
	new_path = ?(ПустаяСтрока(ДанныеФайла.new_id), Ванесса.ДополнитьСлешВПуть(Ванесса.ПутьКПапкеGit) + new_name, "blob:" + ДанныеФайла.new_id);
	VanessaTabs = Ванесса.VanessaTabs;
	
	УстановитьТекЗначенияДляОткрытияВкладкиDiff(old_text, old_name, old_path, new_text, new_name, new_path, new_name, Кодировка);
	ОткрытиеВкладкиDiff();
	
КонецПроцедуры

&НаКлиенте
Процедура ОкончаниеПоискаРепозитория(Результат, ПараметрыВызова, ДопПараметры) Экспорт
	
	Данные = Ванесса.ПрочитатьОбъектJSON(Результат);
	Если Данные.Success Тогда
		ОписаниеОповещения = Новый ОписаниеОповещения("ОкончаниеОткрытияРепозиторая", ЭтаФорма);
		Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingOpen(ОписаниеОповещения, Ванесса.ПутьКПапкеGit);
	КонецЕсли;	 
	
КонецПроцедуры

&НаКлиенте
Процедура ОкончаниеОткрытияРепозиторая(Результат, ПараметрыВызова, ДопПараметры) Экспорт
	
	Данные = Ванесса.ПрочитатьОбъектJSON(Результат);
	Если Данные.Success Тогда
		НачатьПолучениеСтатуса();
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура НачатьПолучениеСтатуса(ДопПараметры = Неопределено)
	Ванесса.ВнешняяКомпонентаРаботаСGit.BeginGettingHead(Новый ОписаниеОповещения("ПослеПолученияHead", ЭтаФорма));
	Ванесса.ВнешняяКомпонентаРаботаСGit.BeginCallingStatus(Новый ОписаниеОповещения("ПослеПолученияСтатуса", ЭтаФорма, ДопПараметры));
КонецПроцедуры 

&НаКлиенте
Процедура ПослеПолученияHead(Результат, ДопПараметры) Экспорт
	
	Данные = Ванесса.ПрочитатьОбъектJSON(Результат);
	Если Данные.Success Тогда
		Файл = Новый Файл(Данные.Result);
		Ванесса.Элементы.ДеревоGitВыборВетки.Заголовок = Файл.Имя;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеПолученияСтатуса(Результат, ПараметрыВызова, ДопПараметры) Экспорт
	
	StagedФайлы = Новый СписокЗначений;
	ИзмененныеФайлы = Новый СписокЗначений;
	УдаленныеФайлы = Новый СписокЗначений;
	НовыеФайлы = Новый СписокЗначений;
	
	Данные = Ванесса.ПрочитатьОбъектJSON(Результат);
	Если Данные.success Тогда
		Если Данные.result <> Неопределено И Данные.result.Свойство("index") Тогда
			Для Каждого ДанныеФайла Из Данные.result.index Цикл
				status = ВРег(ДанныеФайла.status);
				
				Если status = "IGNORED" Тогда
					Продолжить;
				КонецЕсли;	 
				
				StagedФайлы.Добавить(ДанныеФайла);
				
			КонецЦикла;	 
		КонецЕсли;	 
	ИначеЕсли Данные.error.code = 0 Тогда
	КонецЕсли;
	
	СтрокаКоманды = "
	|cd /d ""%1""
	|git status > ""%2"" 2>&1 ";
	
	ФайлВыводКонсоли = ПолучитьИмяВременногоФайла("txt");
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды, "%1", Ванесса.ПутьКПапкеGit);
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды, "%2", ФайлВыводКонсоли);
	
	Ванесса.ВыполнитьКомандуОСБезПоказаЧерногоОкна(СтрокаКоманды);
	
	Если Ванесса.ФайлСуществуетКомандаСистемы(ФайлВыводКонсоли) Тогда
		Текст = Новый ЧтениеТекста;
		Текст.Открыть(ФайлВыводКонсоли,"UTF-8");
		ВыводКонсоли = Текст.Прочитать();
		Текст.Закрыть();
		
		ПолучитьИзмененныеФайлы(ИзмененныеФайлы, УдаленныеФайлы, НовыеФайлы, ВыводКонсоли);
	КонецЕсли;	 
	
	Если Данные.result <> Неопределено И Данные.result.Свойство("work") Тогда
		Для Каждого ДанныеФайла Из Данные.result.work Цикл
			Элем = ИзмененныеФайлы.НайтиПоЗначению(ДанныеФайла.new_name);
			Если Элем <> Неопределено Тогда
				Элем.Значение = ДанныеФайла;
			КонецЕсли;	 
			Элем = УдаленныеФайлы.НайтиПоЗначению(ДанныеФайла.new_name);
			Если Элем <> Неопределено Тогда
				Элем.Значение = ДанныеФайла;
			КонецЕсли;	 
			Элем = НовыеФайлы.НайтиПоЗначению(ДанныеФайла.new_name);
			Если Элем <> Неопределено Тогда
				Элем.Значение = ДанныеФайла;
			КонецЕсли;	 
		КонецЦикла;	 
	КонецЕсли;	 
	
	ОбновитьДеревоGit(StagedФайлы, ИзмененныеФайлы, УдаленныеФайлы, НовыеФайлы, ДопПараметры);
	
КонецПроцедуры

&НаКлиенте
Функция НомерКартинкиПоСтатусу(Статус)
	Если Статус = "MODIFIED" Тогда
		Возврат 3; 
	ИначеЕсли Статус = "DELETED" Тогда
		Возврат 2; 
	ИначеЕсли Статус = "UNTRACKED" Тогда
		Возврат 1; 
	ИначеЕсли Статус = "ADDED" Тогда
		Возврат 1; 
	КонецЕсли;	 
КонецФункции	 

&НаКлиенте
Процедура ОбновитьДеревоGit(StagedФайлы, ИзмененныеФайлы, УдаленныеФайлы, НовыеФайлы, ДопПараметры)
	СтрокаДляАктивации = Неопределено;
	ИмяФайлаДляАктивации = Неопределено;
	Если ТипЗнч(ДопПараметры) = Тип("Структура") Тогда
		Если ДопПараметры.Свойство("ИмяФайлаДляАктивации") Тогда
			ИмяФайлаДляАктивации = ДопПараметры.ИмяФайлаДляАктивации;
		КонецЕсли;	 
	КонецЕсли;
	
	КореньДерева = Ванесса.ДеревоGit.ПолучитьЭлементы();
	КореньДерева.Очистить();
	Если StagedФайлы.Количество() > 0 Тогда
		УзелStaged = КореньДерева.Добавить();
		УзелStaged.Файл = "Staged";
		УзелStaged.Тип = "Staged";
		СтрокиДерева = УзелStaged.ПолучитьЭлементы();
		Ванесса.Элементы.ДеревоGitДеревоGitЗафиксировать.Доступность = Истина;
		Для Каждого Элем Из StagedФайлы Цикл
			СтрокаФайл = СтрокиДерева.Добавить();
			СтрокаФайл.Файл = Элем.Значение.new_name;
			СтрокаФайл.ТипКартинки = НомерКартинкиПоСтатусу(Элем.Значение.status);
			СтрокаФайл.Статус = Элем.Значение.status;
			СтрокаФайл.ДанныеФайла = Элем.Значение;
			
			Если ИмяФайлаДляАктивации = СтрокаФайл.Файл Тогда
				СтрокаДляАктивации = СтрокаФайл;
			КонецЕсли;	 
		КонецЦикла;	 
		
		ИдентификаторСтроки = УзелStaged.ПолучитьИдентификатор();
		Ванесса.Элементы.ДеревоGit.Развернуть(ИдентификаторСтроки);
	Иначе
		Ванесса.Элементы.ДеревоGitДеревоGitЗафиксировать.Доступность = Ложь;
	КонецЕсли;
	
	УзелUnstaged = КореньДерева.Добавить();
	УзелUnstaged.Файл = "Unstaged";
	УзелUnstaged.Тип = "Unstaged";
	СтрокиДерева = УзелUnstaged.ПолучитьЭлементы();
	
	Для Каждого Элем Из ИзмененныеФайлы Цикл
		СтрокаФайл = СтрокиДерева.Добавить();
		Если ТипЗнч(Элем.Значение) = Тип("Структура") Тогда
			СтрокаФайл.Файл = Элем.Значение.new_name;
			СтрокаФайл.ДанныеФайла = Элем.Значение;
		Иначе	
			СтрокаФайл.Файл = Элем.Значение;
		КонецЕсли;	 
		СтрокаФайл.ТипКартинки = НомерКартинкиПоСтатусу("MODIFIED");
		СтрокаФайл.Статус = "MODIFIED";
		
		Если ИмяФайлаДляАктивации = СтрокаФайл.Файл Тогда
			СтрокаДляАктивации = СтрокаФайл;
		КонецЕсли;	 
	КонецЦикла;	 
	
	Для Каждого Элем Из УдаленныеФайлы Цикл
		СтрокаФайл = СтрокиДерева.Добавить();
		Если ТипЗнч(Элем.Значение) = Тип("Структура") Тогда
			СтрокаФайл.Файл = Элем.Значение.new_name;
			СтрокаФайл.ДанныеФайла = Элем.Значение;
		Иначе	
			СтрокаФайл.Файл = Элем.Значение;
		КонецЕсли;	 
		СтрокаФайл.ТипКартинки = НомерКартинкиПоСтатусу("DELETED");
		СтрокаФайл.Статус = "DELETED";
		
		Если ИмяФайлаДляАктивации = СтрокаФайл.Файл Тогда
			СтрокаДляАктивации = СтрокаФайл;
		КонецЕсли;	 
	КонецЦикла;	 
	
	Для Каждого Элем Из НовыеФайлы Цикл
		СтрокаФайл = СтрокиДерева.Добавить();
		Если ТипЗнч(Элем.Значение) = Тип("Структура") Тогда
			СтрокаФайл.Файл = Элем.Значение.new_name;
			СтрокаФайл.ДанныеФайла = Элем.Значение;
		Иначе	
			СтрокаФайл.Файл = Элем.Значение;
		КонецЕсли;	 
		СтрокаФайл.ТипКартинки = НомерКартинкиПоСтатусу("UNTRACKED");
		СтрокаФайл.Статус = "UNTRACKED";
		
		Если ИмяФайлаДляАктивации = СтрокаФайл.Файл Тогда
			СтрокаДляАктивации = СтрокаФайл;
		КонецЕсли;	 
	КонецЦикла;	 
	
	ИдентификаторСтроки = УзелUnstaged.ПолучитьИдентификатор();
	Ванесса.Элементы.ДеревоGit.Развернуть(ИдентификаторСтроки);
	
	Если СтрокаДляАктивации <> Неопределено Тогда
		Ванесса.Элементы.ДеревоGit.ТекущаяСтрока = СтрокаДляАктивации.ПолучитьИдентификатор();
	КонецЕсли;	 
	
КонецПроцедуры 

&НаКлиенте
Процедура ПолучитьИзмененныеФайлы(ИзмененныеФайлы, УдаленныеФайлы, НовыеФайлы, ВыводКонсоли);
	МассивСтрок = Ванесса.РазложитьСтрокуВМассивПодстрокКлиент(ВыводКонсоли, Символы.ПС);
	НашлиModified = Ложь;
	НашлиUntracked = Ложь;
	Для Каждого Стр Из МассивСтрок Цикл
		Если ПустаяСтрока(Стр) Тогда
			Продолжить;
		КонецЕсли;	 
		
		Если Найти(Стр, "Changes not staged for commit:") > 0 Тогда
			НашлиModified = Истина;
			Продолжить;
		ИначеЕсли Найти(Стр, "Untracked files:") > 0 Тогда
			НашлиUntracked = Истина;
			Продолжить;
		ИначеЕсли Найти(Стр, "no changes added to commit (") > 0 Тогда
			Продолжить;
		ИначеЕсли Найти(Стр, "nothing added to commit but untracked files present") > 0 Тогда
			Продолжить;
		КонецЕсли;	 
		
		Если НЕ НашлиModified И НЕ НашлиUntracked Тогда
			Продолжить;
		КонецЕсли;	 
		
		Если НашлиUntracked Тогда
			Если Найти(Стр, "to include in what will be committed)") > 0 Тогда
				Продолжить;
			КонецЕсли;	 
		КонецЕсли;	 
		
		Стр = СокрЛ(Стр);
		
		Если НЕ НашлиUntracked Тогда
			Если Лев(Стр, 9) = "modified:" Тогда
				Стр = СокрЛ(Сред(Стр, 10));
				ИзмененныеФайлы.Добавить(Стр);
			ИначеЕсли Лев(Стр, 8) = "deleted:" Тогда
				Стр = СокрЛ(Сред(Стр, 10));
				УдаленныеФайлы.Добавить(Стр);
			КонецЕсли;
		Иначе	
			Стр = СокрЛ(Стр);
			НовыеФайлы.Добавить(Стр);
		КонецЕсли;	 
		
	КонецЦикла;	
КонецПроцедуры 

&НаКлиенте
Процедура ДоступностьКнопокGit(Статус)
	Ванесса.Элементы.ДеревоGitДобавитьВИндекс.Доступность = Статус;
	Ванесса.Элементы.ДеревоGitДеревоGitУбратьИзИндекса.Доступность = Статус;
КонецПроцедуры

#КонецОбласти