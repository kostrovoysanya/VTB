-- Вывод должников с долгом выше среднего
SELECT Name, DebtAmount  -- SELECT - выбор данных, Name - столбец Name, DebtAmount - столбец DebtAmount
FROM Debtors  -- FROM - указание таблицы, из которой выполняется выборка
WHERE DebtAmount > (SELECT AVG(DebtAmount) FROM Debtors);  -- WHERE - условие, DebtAmount - столбец DebtAmount, SELECT AVG(DebtAmount) - вложенный запрос для получения среднего значения долга, FROM Debtors - указание таблицы для вложенного запроса
