	
	#Область ПрограммныйИнтерфейс
	Процедура ДополнитьФорму(Форма) Экспорт
		
		ИмяФормы = Форма.ИмяФормы;
		
		Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
			ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
			ДобавитьПолеСогласованнаяСкидкаВГруппаСкидка(Форма);
			ДобавитьКнопкуПересчитатьТаблицуВГруппаСкидка(Форма);
			
		ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
			ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
			ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
			
		ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
			ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
		ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
			ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
		КонецЕсли;	
		
	КонецПроцедуры
	
	#КонецОбласти 
	
	#Область СлужебныйПрограммныйИнтерфейс
	
	Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		
		ПолеКонтактноеЛицо = Форма.Элементы.Добавить("ДР_КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
		ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
		ПолеКонтактноеЛицо.ПутьКДанным = "Объект.ДР_КонтактноеЛицо";
	КонецПроцедуры   
	
	
	 Процедура ДобавитьПолеСогласованнаяСкидкаВГруппаСкидка(Форма);
		
		ПолеСогласованнаяСкидка = Форма.Элементы.Добавить("ДР_СогласованнаяСкидка", Тип("ПолеФормы"), Форма.Элементы.ГруппаСкидка);
		ПолеСогласованнаяСкидка.Вид = ВидПоляФормы.ПолеВвода;
		ПолеСогласованнаяСкидка.ПутьКДанным = "Объект.ДР_СогласованнаяСкидка";
		Форма.Элементы.ДР_СогласованнаяСкидка.УстановитьДействие("ПриИзменении", "ДР_СогласованнаяСкидкаПриИзменении");
	 КонецПроцедуры
	
	
	Процедура ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
		
		ПолеКонтактноеЛицо = Форма.Элементы.Вставить("ДР_КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
		ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
		ПолеКонтактноеЛицо.ПутьКДанным = "Объект.ДР_КонтактноеЛицо";
	КонецПроцедуры
	
	
    Процедура ДобавитьКнопкуПересчитатьТаблицуВГруппаСкидка(Форма);    
		
		    КомандаПересчитатьТаблицу = Форма.Команды.Добавить("ПересчитатьТаблицу");
			КомандаПересчитатьТаблицу.Заголовок = "ПересчитатьТаблицу";
			КомандаПересчитатьТаблицу.Действие = "ПересчитатьТаблицу";
			
			Кнопка = Форма.Элементы.Добавить("ПересчитатьТаблицу", Тип("КнопкаФормы"), Форма.Элементы.ГруппаСкидка);
			Кнопка.ИмяКоманды = "ПересчитатьТаблицу";
			Кнопка.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
			Кнопка.ЦветТекста = Новый Цвет(255,0,0);
			
	КонецПроцедуры
	
	  	
	#КонецОбласти 
