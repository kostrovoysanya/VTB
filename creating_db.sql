-- Удаляем базу данных, если она существует
DROP DATABASE IF EXISTS TaskDB;  -- DROP DATABASE IF EXISTS - удаление базы данных, если она существует
                                 -- TaskDB - название базы данных

-- Создаем базу данных
CREATE DATABASE TaskDB;  -- CREATE DATABASE - создание базы данных
                         -- TaskDB - название базы данных

-- Подключаемся к базе данных TaskDB (для командной оболочки psql)
-- \c TaskDB  -- подключение к базе данных TaskDB
