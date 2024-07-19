-- Удаляем базу данных, если она существует
DROP DATABASE IF EXISTS TaskDB;  -- DROP DATABASE IF EXISTS - удаление базы данных, если она существует
                                 -- TaskDB - название базы данных

-- Создаем базу данных
CREATE DATABASE TaskDB;  -- CREATE DATABASE - создание базы данных
                         -- TaskDB - название базы данных

-- Подключаемся к базе данных TaskDB (для командной оболочки psql)
-- \c TaskDB  -- подключение к базе данных TaskDB

-- Создаем таблицу Operators
CREATE TABLE Operators (
    OperatorID SERIAL PRIMARY KEY,  -- SERIAL - автоинкрементный тип данных, PRIMARY KEY - первичный ключ
    Name VARCHAR(100),  -- VARCHAR - строковый тип данных с максимальной длиной 100 символов
    StartDate DATE  -- DATE - тип данных для хранения даты
);

-- Создаем таблицу Debtors
CREATE TABLE Debtors (
    DebtorID SERIAL PRIMARY KEY,  -- SERIAL - автоинкрементный тип данных, PRIMARY KEY - первичный ключ
    Name VARCHAR(100),  -- VARCHAR - строковый тип данных с максимальной длиной 100 символов
    DebtAmount DECIMAL(10, 2)  -- DECIMAL - числовой тип данных с точностью, (10, 2) - 10 знаков до и 2 после запятой
);

-- Создаем таблицу Phones
CREATE TABLE Phones (
    PhoneID SERIAL PRIMARY KEY,  -- SERIAL - автоинкрементный тип данных, PRIMARY KEY - первичный ключ
    DebtorID INT REFERENCES Debtors(DebtorID),  -- INT - целочисленный тип данных, REFERENCES - создание внешнего ключа
    PhoneNumber VARCHAR(15)  -- VARCHAR - строковый тип данных с максимальной длиной 15 символов
);

-- Создаем таблицу Payments
CREATE TABLE Payments (
    PaymentID SERIAL PRIMARY KEY,  -- SERIAL - автоинкрементный тип данных, PRIMARY KEY - первичный ключ
    DebtorID INT REFERENCES Debtors(DebtorID),  -- INT - целочисленный тип данных, REFERENCES - создание внешнего ключа
    PaymentDate DATE,  -- DATE - тип данных для хранения даты
    PaymentAmount DECIMAL(10, 2)  -- DECIMAL - числовой тип данных с точностью, (10, 2) - 10 знаков до и 2 после запятой
);

-- Создаем таблицу Addresses
CREATE TABLE Addresses (
    AddressID SERIAL PRIMARY KEY,  -- SERIAL - автоинкрементный тип данных, PRIMARY KEY - первичный ключ
    DebtorID INT REFERENCES Debtors(DebtorID),  -- INT - целочисленный тип данных, REFERENCES - создание внешнего ключа
    Address VARCHAR(255),  -- VARCHAR - строковый тип данных с максимальной длиной 255 символов
    City VARCHAR(100),  -- VARCHAR - строковый тип данных с максимальной длиной 100 символов
    PostalCode VARCHAR(10)  -- VARCHAR - строковый тип данных с максимальной длиной 10 символов
);
