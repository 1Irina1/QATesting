﻿#language: ru

@tree

Функционал: заполнение поля Организация в Заказе покупателя

Сценарий: заполнение поля Организация в Заказе покупателя

Если поле с именем "Agreement" заполнено Тогда
    Тогда поле с именем "Company" заполнено
ИначеЕсли поле с именем "Company" заполнено Тогда
        И я нажимаю кнопку выбора у поля с именем "Company"
        Тогда открылось окно 'Организации'
        И в таблице "List" я перехожу к строке:
            | 'Наименование'           |
            | 'Собственная компания 2' |
        И я нажимаю на кнопку с именем 'FormChoose'
        