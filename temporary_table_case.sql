-- Создание временной таблицы с задолженностью
CREATE TEMPORARY TABLE TempDebtors AS  -- CREATE TEMPORARY TABLE - создание временной таблицы, TempDebtors - название временной таблицы, AS - указание на использование данных из запроса
SELECT DebtorID, Name, DebtAmount,
       CASE  -- CASE - оператор для выполнения условных операций
           WHEN DebtAmount > 40000 THEN 'High'  -- WHEN - условие, THEN - результат выполнения условия
           WHEN DebtAmount BETWEEN 20000 AND 40000 THEN 'Medium'  -- BETWEEN - условие между двумя значениями, AND - разделение условий
           ELSE 'Low'  -- ELSE - результат, если ни одно из условий не выполнено
       END AS DebtLevel  -- END AS - завершение оператора CASE и задание алиаса для результирующего столбца
FROM Debtors;  -- FROM - указание таблицы, из которой выполняется выборка