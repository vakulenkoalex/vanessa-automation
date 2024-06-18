# encoding: utf-8
# language: ru

@ExportScenarios

Функционал: Я хочу эмулировать сканирование штрихкода
	Как Разработчик я хочу
    Чтобы у меня была библиотека для стандартных команд 1С для эмулирования сканирования штрихкода
    чтобы я мог запускать автосгенерированные фичи по действиям пользователя без написания кода
	
Сценарий: Сканируем штрихкод "4607010245597" 
	Когда я нажимаю на кнопку "Ручной ввод штрихкода"
	Тогда открылось окно "Введите штрихкод"
	И в поле "Строка" я ввожу текст "4607010245597"
	И я нажимаю на кнопку "Принять"
