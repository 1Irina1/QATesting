﻿	#language: ru

@tree

Функционал: создание документа Поступление товаров

Как Менеджер складской логистики я хочу
создание документа поступление товаров 
чтобы поставить товар на учет

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание докуемнта поступления товара

	*Открытие формы создания документа
		И В командном интерфейсе я выбираю 'Закупки' 'Приобретение товаров и услуг'
		Тогда открылось окно 'Приобретение товаров и услуг'
		И в таблице "СписокДокументыПоступления" я нажимаю на кнопку с именем 'СписокДокументыПоступленияСоздать'
		Тогда открылось окно 'Приобретение товаров и услуг (создание)'
	*Заполнение шапки документа
		И я нажимаю кнопку выбора у поля с именем "Партнер"
		Тогда открылось окно 'Партнеры (Поставщики)'
		И в таблице "Список" я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылось окно 'Найти'
		И в поле с именем 'Pattern' я ввожу текст 'нлмк'
		И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Партнеры (Поставщики)'
		И в таблице "Список" я нажимаю на кнопку с именем 'ФормаВыбрать'
		Тогда открылось окно 'Приобретение товаров и услуг (создание) *'
		И я нажимаю кнопку выбора у поля с именем "Соглашение"
		Тогда открылось окно 'Соглашения с поставщиками об условиях закупок'
		И в таблице "Список" я перехожу к строке:
			| 'Валюта' | 'Наименование'                     | 'Организация'  | 'Состояние' |
			| 'RUB'    | 'Основное соглашение: НЛМК Ростов' | 'ЕВРАЗ Маркет' | 'Действует' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Приобретение товаров и услуг (создание) *'
		И я нажимаю кнопку выбора у поля с именем "Договор"
		Тогда открылось окно 'Договоры с контрагентами'
		И в таблице "Список" я нажимаю на кнопку с именем 'СписокВыбрать'
		Тогда открылось окно 'Приобретение товаров и услуг (создание) *'
		И я нажимаю кнопку выбора у поля с именем "Склад"
		Тогда открылось окно 'Склады и магазины'
		И я нажимаю на кнопку с именем 'ФормаСписок'
		И в таблице "Список" я активизирую поле с именем "Наименование"
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'           | 'Подразделение' |
			| 'Ростов, Доватора 152 б' | 'Ростов'        |
		И в таблице "Список" я выбираю текущую строку
	*Заполнение товарной части
		Тогда открылось окно 'Приобретение товаров и услуг (создание) *'
		И я перехожу к закладке с именем "ГруппаТовары"
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыНоменклатура" я выбираю по строке 'Арматура 10 (мотки) А240 ГОСТ 34028-2016'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыХарактеристика" я выбираю по строке 'НЛМК-Урал'
		И в таблице "Товары" в поле с именем 'ТоварыКоличествоУпаковок' я ввожу текст '10,000'
		И в таблице "Товары" я завершаю редактирование строки
		И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '70 000,00'
		И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"
		И в таблице "Товары" я завершаю редактирование строки
		И я перехожу к закладке с именем "ГруппаДополнительно"
		И я нажимаю кнопку выбора у поля с именем "ДатаВходящегоДокумента"
		И в поле с именем 'ДатаВходящегоДокумента' я ввожу текущую дату
		И я нажимаю кнопку выбора у поля с именем "евт_ТранспортноеСредство"
		Тогда открылось окно 'Транспортные средства'
		И в таблице "Список" я перехожу к строке:
			| 'Вместимость, куб. м' | 'Грузоподъемность, т' | 'Наименование' |
			| '21,000'              | '88,000'              | 'Т668УС 72 '   |
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		И я нажимаю на кнопку "Записать"
		*Проверка заполнения табличной части
			Тогда таблица "Товары" содержит строки:
				| 'Количество' | 'Номенклатура'                             | 'Сумма с НДС' | 'Характеристика' | 'Вид цены'                         | 'Цена'      | 'Сумма'      | 'Склад'                  | 'Подразделение-получатель' | 'Аналитика расходов'               | 'Заказ поставщику' | 'Сделка' | 'Статья расходов'                  | 'Списать на расходы' | 'Номер ГТД' |
				| '10,000'     | 'Арматура 10 (мотки) А240 ГОСТ 34028-2016' | '700 000'     | 'НЛМК-Урал'      | 'Основное соглашение: НЛМК Ростов' | '70 000,00' | '700 000,00' | 'Ростов, Доватора 152 б' | '<для работ/услуг>'        | '<для работ/услуг без назначения>' | ''                 | ''       | '<для работ/услуг без назначения>' | 'Нет'                | ''          |
		*Проведение документа
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Приобретение товаров и услуг (создание) *' в течение 20 секунд