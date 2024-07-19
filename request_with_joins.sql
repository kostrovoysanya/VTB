-- Получение списка должников вместе с их номерами телефонов
SELECT d.Name AS DebtorName,  -- SELECT - выбор данных, d.Name - столбец Name из таблицы Debtors с алиасом d, AS - элиас для переименования столбца
       p.PhoneNumber  -- p.PhoneNumber - столбец PhoneNumber из таблицы Phones с элиасом p
FROM Debtors d  -- FROM - указание таблицы, из которой выполняется выборка, d - элиас для таблицы Debtors
JOIN Phones p ON d.DebtorID = p.DebtorID;  -- JOIN - соединение таблиц, ON - условие соединения, d.DebtorID - столбец DebtorID из таблицы Debtors, p.DebtorID - столбец DebtorID из таблицы Phones
