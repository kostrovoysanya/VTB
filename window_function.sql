-- Использование оконной функции для расчета накопленного итога по платежам
SELECT DebtorID, PaymentDate, PaymentAmount,
       SUM(PaymentAmount) OVER (PARTITION BY DebtorID ORDER BY PaymentDate) AS RunningTotal  -- SUM(PaymentAmount) OVER - использование оконной функции для расчета суммы, PARTITION BY - разделение данных по DebtorID, ORDER BY - сортировка по PaymentDate, AS - элиас для переименования столбца
FROM Payments;  -- FROM - указание таблицы, из которой выполняется выборка, Payments - название таблицы