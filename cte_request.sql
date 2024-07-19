-- Использование CTE для получения должников с высоким уровнем задолженности
WITH HighDebtors AS (  -- WITH - начало CTE, HighDebtors - название CTE
    SELECT DebtorID, Name, DebtAmount  -- SELECT - выбор данных, DebtorID - столбец DebtorID, Name - столбец Name, DebtAmount - столбец DebtAmount
    FROM Debtors  -- FROM - указание таблицы, из которой выполняется выборка
    WHERE DebtAmount > 40000  -- WHERE - условие, DebtAmount > 40000 - должники с задолженностью более 40000
)
SELECT *  -- SELECT - выбор данных, * - все столбцы
FROM HighDebtors;  -- FROM - указание CTE, из которого выполняется выборка, HighDebtors - название CTE