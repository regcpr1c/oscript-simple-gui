#Использовать ParserV8i

Процедура ВывестиИнформацию(СписокБаз)
	Для каждого База Из СписокБаз Цикл
		СтруктураАдреса = База.Значение;

		Сообщить(База.Ключ);
		//Сообщить(СтруктураАдреса.Name);
		Для каждого Часть Из СтруктураАдреса Цикл
			//Сообщить("	" + Часть.Ключ + " = " + Часть.Значение);
			// Если Часть.Ключ = "Connect" Тогда
			// 	Сообщить("		" + Часть.Ключ + " = " +  Часть.Значение.String);
			// 	Для каждого ЧастьПути Из Часть.Значение.Structure Цикл
			// 		Сообщить("		" + ЧастьПути.Ключ + " = " +  ЧастьПути.Значение);
			// 	КонецЦикла;
			// КонецЕсли;
		КонецЦикла;
	КонецЦикла;
КонецПроцедуры

Парсер = Новый ПарсерСпискаБаз;


Сообщить("Вывод основного файла");
//Парсер.УстановитьФайл("c:\Users\ushakov\Downloads\ibases.v8i");
Парсер.УстановитьФайл("c:\Users\ushakov\Documents\github\parserV8i\examples\ibases.v8i");
СписокБаз = Парсер.ПолучитьСписокБаз();
ВывестиИнформацию(СписокБаз);

// Сообщить("---------------------------------");
// Сообщить("Вывод явно указанного файла");
// Парсер.УстановитьФайл("examples/ibases.v8i");
// СписокБаз = Парсер.ПолучитьСписокБаз();
// ВывестиИнформацию(СписокБаз);



// #Использовать asserts
// #Использовать gui

// Перем Структура1;

// Функция ПолучитьСписокТестов(Тестирование) Экспорт
// 	СписокТестов = Новый Массив;
// 	СписокТестов.Добавить("Тест_Должен_ВернутьКоличествоЭлементовНоль");
// 	Возврат СписокТестов;
// КонецФункции

// Процедура ПолучитьСтруктуру1() Экспорт
//     Структура1 = Новый Структура;
// КонецПроцедуры

// Процедура Тест_Должен_ВернутьКоличествоЭлементовНоль() Экспорт
// 	ПолучитьСтруктуру1();
// 	Структура1.Вставить("Данные",1);
// 	Ожидаем.Что(Структура1.Количество()).Равно(1);
// КонецПроцедуры