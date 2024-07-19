-- Подсчет общего количества должников и их суммарного долга
SELECT COUNT(*) AS TotalDebtors,  -- COUNT(*) - подсчет общего количества строк в таблице, AS - переименование результата в TotalDebtors
       SUM(DebtAmount) AS TotalDebt  -- SUM(DebtAmount) - суммирование значений в столбце DebtAmount, AS - переименование результата в TotalDebt
FROM Debtors;  -- FROM - указание таблицы, из которой выбираются данные, Debtors - название таблицы
