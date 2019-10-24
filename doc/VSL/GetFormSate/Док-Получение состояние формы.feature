﻿# language: ru

@IgnoreOnCIMainBuild



Функциональность: Получение состояние формы

 
Контекст:
	Дано я запускаю SikuliX сервер
	Дано Я открываю Vanessa-Automation в TestClient для записи автодокументации "TestManager"

	И я устанавливаю профиль цвета "MainForm"
		| 'Шрифт'      | 'arial' |
		| 'ЦветФона'   | 'white' |
		| 'ЦветШрифта' | 'black' |
		| 'Размер'     | '18'    |	
		
	И я устанавливаю основной профиль цвета "MainForm"
	

Сценарий: Получение состояние формы

	//@YandexTTS: oksana,good 
	И текст субтитров "Привет! Я - Ванесса!"
	
	@YandexTTS: ermil,evil 
	И текст субтитров "Привет, Ванесса! Расскажи пожалуйста как мне в сценарии проверить состояние элемента формы?"

	//@YandexTTS: oksana,good 
	И текст субтитров "Не проблема, тебе просто нужно выбрать правильный пункт меню!"


	
	*Давай подкл^ючим клиент тестирования на закладке Клиенты тестирования.
		И я перехожу к закладке "Клиенты тестирования"
		Затем клик на картинку "ConnectTestClient"
		//И в таблице "ДанныеКлиентовТестирования" я нажимаю на кнопку с именем 'ТестКлиентПодключить'
		
	#[autodoc.ignorestep]	
	И пауза 12
		
	* И откроем в нём какую-нибудь форму списка.
		Затем клик на картинку "Основная"
		Затем клик на картинку "Справочник1"
	
	* Расположим ^окна поудобнее, чтобы было видно и менеджера тестирования и клиента тестирования.
		Дано я нажимаю хоткей "right" "win"
		Затем клик на картинку "Vanessa_Automation"
		Дано я нажимаю хоткей "left" "win"
			
	* Теперь можно получить состояние текущего элемента формы. В данном случае это таблица справочника.
		@DoNotMoveMouse
		И я перехожу к закладке с именем "ГруппаДополнительно"
	
	* Для этого выберем пункт меню - Получить состояние текущего элемента формы
		Затем клик на текст "Форма"	
		Затем клик на текст "Получить состояние текущего элемента формы"	
			

	И текст субтитров "Мы получили шаг, который проверяет форму списка."
	И текст субтитров "Он уже готов для использования и его можно скопировать в сценарий."
	И текст субтитров "Таким же образом можно получать шаги для флагов, пол^ей и так далее."
	
	@YandexTTS: ermil,evil 
	И текст субтитров "Отлично! А если я захочу проверить состояние сразу всех элементов формы?"

	* Для этого выбери пункт меню - Получить состояние всей формы.
		Затем клик на текст "Форма"	
		Затем клик на текст "Получить состояние всей формы"	
			
	@YandexTTS: ermil,evil 
	И текст субтитров "Спасибо Ванесса! Пойду доработаю свой сценарий!"
			
	Дано текст субтитров "На этом всё. Подписывайтесь, ставьте лайки, до новых встреч!"
	Дано видеовставка "Ванесса! Тесты - есть!"
	
	
					