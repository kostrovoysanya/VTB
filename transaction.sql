-- Начало транзакции
BEGIN;  -- BEGIN - начало транзакции

-- Обновление данных в таблице Debtors
UPDATE Debtors  -- UPDATE - обновление данных в таблице
SET DebtAmount = DebtAmount * 1.1  -- SET - установка нового значения, DebtAmount = DebtAmount * 1.1 - увеличение задолженности на 10%
WHERE DebtorID = 1;  -- WHERE - условие для обновления, DebtorID = 1 - обновление для должника с ID 1

-- Вставка данных в таблицу Payments
INSERT INTO Payments (DebtorID, PaymentDate, PaymentAmount)  -- INSERT INTO - вставка данных в таблицу
VALUES (1, '2023-07-01', 1000.00);  -- VALUES - значения для вставки, (1, '2023-07-01', 1000.00) - вставка для должника с ID 1, дата платежа 2023-07-01, сумма 1000.00

-- Завершение транзакции
COMMIT;  -- COMMIT - фиксация изменений, выполненных в рамках  данной транзакции