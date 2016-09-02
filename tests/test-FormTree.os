#Использовать asserts

Перем юТест;
Перем ВидыПоляФормы;
Перем Форма;
Перем ТекстПроверки;
Перем УправляемыйИнтерфейс;
Перем Поле1;
Перем ПровайдерТЗ;

Процедура Инициализация()
	ПодключитьВнешнююКомпоненту("oscript-component/bin/Release/oscript-simple-gui.dll");
КонецПроцедуры

Функция ПолучитьСписокТестов(Тестирование) Экспорт
	
	юТест = Тестирование;
	
	СписокТестов = Новый Массив;
	СписокТестов.Добавить("Тест_Должен_СоздатьПоле");
	СписокТестов.Добавить("Тест_Должен_ОбработатьТекущаяСтрока");
	СписокТестов.Добавить("Тест_Должен_ОбработатьТекущиеДанные");
	СписокТестов.Добавить("Тест_Должен_УправлятьКолонками");
	СписокТестов.Добавить("Тест_Должен_УправлятьСобытиями");
	
	Возврат СписокТестов;
	
КонецФункции

//# Работа с событиями
Процедура ПриОткрытииФормы() Экспорт
	Форма.Закрыть();
КонецПроцедуры

Процедура ПриВыбореСтроки() Экспорт

	ТекСтр = Поле1.ТекущиеДанные;
	Сообщить("При выборе строки: " + ТекСтр.Год);

КонецПроцедуры

Процедура ПриДвойномКлике() Экспорт
	ТекСтр = Поле1.ТекущиеДанные;
	Сообщить("ПриДвойномКлике: " + ТекСтр.Год);
КонецПроцедуры

Процедура ПриВыборе() Экспорт
	ТекСтр = Поле1.ТекущиеДанные;
	Сообщить("ПриВыборе: " + ТекСтр.Год);
КонецПроцедуры

Процедура ПолучитьФорму()
	
	УправляемыйИнтерфейс = Новый УправляемыйИнтерфейс();
	Форма = УправляемыйИнтерфейс.СоздатьФорму();
	Форма.УстановитьДействие(ЭтотОбъект, "ПриОткрытии", "ПриОткрытииФормы");
	
КонецПроцедуры

Функция ПолучитьТЗ()

	Дерево = Новый ДеревоЗначений();

    Дерево = Новый ДеревоЗначений();
    Дерево.Колонки.Добавить("Год");
    Дерево.Колонки.Добавить("Месяц");
    Дерево.Колонки.Добавить("День");
    
    СтрокаДереваГод = Дерево.Строки.Добавить();
    СтрокаДереваГод.Год = 2016;

    СтрокаДереваМесяц = СтрокаДереваГод.Строки.Добавить();
    СтрокаДереваМесяц.Месяц = "Jan";
    СтрокаДереваМесяц.Год = СтрокаДереваГод.Год;

    СтрокаДереваМесяц = СтрокаДереваГод.Строки.Добавить();
    СтрокаДереваМесяц.Месяц = "Dec";
    СтрокаДереваМесяц.Год = СтрокаДереваГод.Год;

    СтрокаДереваГод = Дерево.Строки.Добавить();
    СтрокаДереваГод.Год = 2017;

    СтрокаДереваМесяц = СтрокаДереваГод.Строки.Добавить();
    СтрокаДереваМесяц.Месяц = "Feb";
    СтрокаДереваМесяц.Год = СтрокаДереваГод.Год;

    СтрокаДереваМесяц = СтрокаДереваГод.Строки.Добавить();
    СтрокаДереваМесяц.Месяц = "Mar";
    СтрокаДереваМесяц.Год = СтрокаДереваГод.Год;

    СтрокаДереваДень = СтрокаДереваМесяц.Строки.Добавить();
    СтрокаДереваДень.День = "1";
    СтрокаДереваДень.Месяц = "Mar";
    СтрокаДереваДень.Год = СтрокаДереваГод.Год;


	Возврат Дерево;

КонецФункции // ПолучитьТЗ()

Процедура Тест_Должен_СоздатьПоле() Экспорт
	
	ПолучитьФорму();
	
	Данные = ПолучитьТЗ();

	ПровайдерТЗ = Новый Провайдер;
	ПровайдерТЗ.ИсточникДерево = Данные;
	
	Поле1 = Форма.Элементы.Добавить("ДеревоФормы1", "ДеревоФормы", Неопределено);
	Поле1.ПутьКДанным = ПровайдерТЗ;
	Поле1.Заголовок = "Провайдер - Дерево значений";
	Поле1.ПоложениеЗаголовка = УправляемыйИнтерфейс.ПоложениеЗаголовка.Верх;
	Поле1.Закрепление = 5;
	Поле1.ТекущаяСтрока = 1;

	Данные.Строки[Поле1.ТекущаяСтрока][0] = "2018";
	Поле1.Обновить();

	юТест.ПроверитьНеРавенство(Форма.Элементы.Найти("ДеревоФормы1"), Неопределено);
	
	Форма.Показать();
	
КонецПроцедуры

Процедура Тест_Должен_ОбработатьТекущаяСтрока() Экспорт
	
	ПолучитьФорму();
	
	Данные = ПолучитьТЗ();

	ПровайдерТЗ = Новый Провайдер;
	ПровайдерТЗ.ИсточникДерево = Данные;
	
	Поле1 = Форма.Элементы.Добавить("ДеревоФормы1", "ДеревоФормы", Неопределено);
	Поле1.ПутьКДанным = ПровайдерТЗ;
	Поле1.Заголовок = "Провайдер - Дерево значений. Тест - Обработка текущая строка";
	Поле1.ПоложениеЗаголовка = УправляемыйИнтерфейс.ПоложениеЗаголовка.Верх;
	Поле1.Закрепление = 5;

	Поле1.ТекущаяСтрока = 1;

	Форма.Показать();
	
КонецПроцедуры


Процедура Тест_Должен_ОбработатьТекущиеДанные() Экспорт
	ПолучитьФорму();
	
	Данные = ПолучитьТЗ();

	ПровайдерТЗ = Новый Провайдер;
	ПровайдерТЗ.ИсточникДерево = Данные;
	
	Поле1 = Форма.Элементы.Добавить("ДеревоФормы1", "ДеревоФормы", Неопределено);
	Поле1.ПутьКДанным = ПровайдерТЗ;
	Поле1.Заголовок = "Провайдер - Дерево значений. Тест: Обработать текущие данные";
	Поле1.ПоложениеЗаголовка = УправляемыйИнтерфейс.ПоложениеЗаголовка.Верх;
	Поле1.Закрепление = 5;

	Поле1.ТекущаяСтрока = 1;
		
	ТекЗначение = "Не обработали";
	ТекСтр = Поле1.ТекущиеДанные;

	юТест.ПроверитьРавенство(ТекСтр.Год, 2017);
	
	Форма.Показать();	
КонецПроцедуры

Процедура Тест_Должен_УправлятьКолонками() Экспорт

	ПолучитьФорму();
	
	Данные = ПолучитьТЗ();

	ПровайдерТЗ = Новый Провайдер;
	ПровайдерТЗ.ИсточникДерево = Данные;
	
	Поле1 = Форма.Элементы.Добавить("ДеревоФормы1", "ДеревоФормы", Неопределено);
	Поле1.ПутьКДанным = ПровайдерТЗ;
	Поле1.Заголовок = "Провайдер - Дерево значений";
	Поле1.ПоложениеЗаголовка = УправляемыйИнтерфейс.ПоложениеЗаголовка.Верх;
	Поле1.Закрепление = 5;
		
	Колонки = Поле1.Колонки;
	Колонки[0].Ширина = 200;
	Колонки[1].Ширина = 100;
	Колонки[1].Заголовок = "Месяц года";

	юТест.ПроверитьРавенство(Колонки[0].Ширина, 200);
	
	Форма.Показать();	
КонецПроцедуры

Процедура Тест_Должен_УправлятьСобытиями() Экспорт
	ПолучитьФорму();
	
	Данные = ПолучитьТЗ();

	ПровайдерТЗ = Новый Провайдер;
	ПровайдерТЗ.ИсточникДерево = Данные;
	
	Поле1 = Форма.Элементы.Добавить("ДеревоФормы1", "ДеревоФормы", Неопределено);
	Поле1.ПутьКДанным = ПровайдерТЗ;
	Поле1.Заголовок = "Провайдер - Дерево значений";
	Поле1.ПоложениеЗаголовка = УправляемыйИнтерфейс.ПоложениеЗаголовка.Верх;
	Поле1.Закрепление = 5;
	Поле1.ТекущаяСтрока = 1;
	
	Поле1.УстановитьДействие(ЭтотОбъект, "ПриВыбореСтроки", "ПриВыбореСтроки");
	Поле1.УстановитьДействие(ЭтотОбъект, "ПриДвойномКлике", "ПриДвойномКлике");
	Поле1.УстановитьДействие(ЭтотОбъект, "ПриВыборе", "ПриВыборе");
	
	
	юТест.ПроверитьНеРавенство(Форма.Элементы.Найти("ДеревоФормы1"), Неопределено);
	
	Форма.Показать();	
КонецПроцедуры


//////////////////////////////////////////////////////////////////////////////////////
// Инициализация

Инициализация();
