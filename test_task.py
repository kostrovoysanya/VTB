import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# 1. Создание DataFrame из данных, введенных вручную, с английскими названиями и терминами
data_manual = {
    'FirstName': ['Aleksey', 'Irina', 'Sergey', 'Mariya', 'Anatoliy', 'Yekaterina', 'Maksim', 'Olga', 'Dmitriy', 'Natalya', 'Igor', 'Elena', 'Vladimir', 'Yuliya', 'Andrey', 'Tatyana', 'Stanislav', 'Anna', 'Konstantin', 'Vera'],
    'LastName': ['Ivanov', 'Petrova', 'Sidorov', 'Kuznetsova', 'Fyodorov', 'Smirnova', 'Popov', 'Morozova', 'Egorov', 'Kovalyova', 'Alekseev', 'Zakharkova', 'Romanov', 'Kuzina', 'Mikhaylov', 'Lebedeva', 'Frolov', 'Sokolova', 'Grigoriev', 'Larina'],
    'Age': [25, 30, 35, 40, 45, 28, 32, 37, 29, 41, 33, 27, 36, 31, 39, 22, 24, 26, 23, 28],
    'City': ['Moscow', 'Saint Petersburg', 'Novosibirsk', 'Yekaterinburg', 'Nizhny Novgorod', 'Kazan', 'Chelyabinsk', 'Omsk', 'Samara', 'Rostov-on-Don', 'Ufa', 'Krasnoyarsk', 'Perm', 'Voronezh', 'Volgograd', 'Sochi', 'Tyumen', 'Barnaul', 'Irkutsk', 'Tula'],
    'Salary': [70000, 80000, 90000, 85000, 95000, 72000, 82000, 87000, 73000, 86000, 83000, 75000, 88000, 79000, 91000, 60000, 62000, 64000, 61000, 63000],
    'Department': ['HR', 'Engineering', 'Marketing', 'Finance', 'HR', 'Engineering', 'Marketing', 'Finance', 'HR', 'Engineering', 'Marketing', 'Finance', 'HR', 'Engineering', 'Marketing', 'HR', 'Engineering', 'Marketing', 'Finance', 'HR'],
    'Gender': ['M', 'F', 'M', 'F', 'M', 'F', 'M', 'F', 'M', 'F', 'M', 'F', 'M', 'F', 'M', 'F', 'M', 'F', 'M', 'F'],
    'PhoneNumber': ['+7 999 123-45-67', '+7 999 234-56-78', '+7 999 345-67-89', '+7 999 456-78-90', '+7 999 567-89-01', '+7 999 678-90-12', '+7 999 789-01-23', '+7 999 890-12-34', '+7 999 901-23-45', '+7 999 012-34-56', '+7 999 111-22-33', '+7 999 222-33-44', '+7 999 333-44-55', '+7 999 444-55-66', '+7 999 555-66-77', '+7 999 666-77-88', '+7 999 777-88-99', '+7 999 888-99-00', '+7 999 999-00-11', '+7 999 000-11-22'],
    'ExperienceYears': [3, 8, 13, 18, 10, 6, 7, 12, 4, 15, 9, 5, 11, 7, 14, 1, 2, 1, 2, 0],
    'Education': ['Bachelor', 'Master', 'Bachelor', 'Master', 'Bachelor', 'Master', 'Bachelor', 'Master', 'Bachelor', 'Master', 'Bachelor', 'Master', 'Bachelor', 'Master', 'Bachelor', 'Master', 'Bachelor', 'Master', 'Bachelor', 'Master']
}

df_manual = pd.DataFrame(data_manual)

# 2. Сохранение первоначальных данных
df_manual.to_csv('initial_data.csv', index=False)

# 3. Обработка данных
# Заполнение пропущенных значений средними значениями по колонкам
df_processed = df_manual.copy()  # Создаем копию для обработки
df_processed['Age'] = df_processed['Age'].fillna(df_processed['Age'].mean())
df_processed['Salary'] = df_processed['Salary'].fillna(df_processed['Salary'].mean())

# Добавление нового столбца с условным значением Seniority
df_processed['Seniority'] = np.where(df_processed['ExperienceYears'] >= 7, 'Senior',
                                      np.where(df_processed['ExperienceYears'] >= 3, 'Middle', 'Junior'))

# Группировка данных по департаменту и полу, вычисление средней зарплаты
gender_department_salary = df_processed.groupby(['Department', 'Gender'])['Salary'].mean().reset_index()

# Группировка данных по уровню образования и стажу работы, вычисление средней зарплаты
education_experience_salary = df_processed.groupby(['Education', 'ExperienceYears'])['Salary'].mean().reset_index()

# Добавление возрастных групп
bins = [20, 30, 40, 50]
labels = ['20-30', '30-40', '40-50']
df_processed['AgeGroup'] = pd.cut(df_processed['Age'], bins=bins, labels=labels, right=False)

# Группировка данных по возрастным группам, вычисление средней зарплаты
age_group_salary = df_processed.groupby('AgeGroup', observed=False)['Salary'].mean().reset_index()

# 4. Визуализация данных
# Построение гистограммы возраста сотрудников
plt.figure(figsize=(10, 6))
plt.hist(df_processed['Age'], bins=5, alpha=0.7, color='blue', edgecolor='black')
plt.xlabel('Age')
plt.ylabel('Frequency')
plt.title('Age Distribution of Employees')
plt.grid(True)
plt.savefig('age_distribution.png')
plt.show()

# Построение столбчатой диаграммы средней зарплаты по департаментам и полу
plt.figure(figsize=(10, 6))
for gender in df_processed['Gender'].unique():
    subset = gender_department_salary[gender_department_salary['Gender'] == gender]
    plt.bar(subset['Department'] + ' (' + gender + ')', subset['Salary'], label=f'Gender: {gender}')
plt.xlabel('Department and Gender')
plt.ylabel('Average Salary')
plt.title('Average Salary by Department and Gender')
plt.xticks(rotation=45)
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig('salary_by_department_and_gender.png')
plt.show()

# Построение столбчатой диаграммы средней зарплаты по уровню образования и стажу работы
plt.figure(figsize=(10, 6))
for education in df_processed['Education'].unique():
    subset = education_experience_salary[education_experience_salary['Education'] == education]
    plt.plot(subset['ExperienceYears'], subset['Salary'], marker='o', label=f'Education: {education}')
plt.xlabel('Experience Years')
plt.ylabel('Average Salary')
plt.title('Average Salary by Education Level and Experience Years')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig('salary_by_education_and_experience.png')
plt.show()

# Построение столбчатой диаграммы средней зарплаты по возрастным группам
plt.figure(figsize=(10, 6))
plt.bar(age_group_salary['AgeGroup'], age_group_salary['Salary'], color='purple')
plt.xlabel('Age Group')
plt.ylabel('Average Salary')
plt.title('Average Salary by Age Group')
plt.grid(True)
plt.tight_layout()
plt.savefig('salary_by_age_group.png')
plt.show()

# Построение круговой диаграммы распределения сотрудников по департаментам
department_count = df_processed['Department'].value_counts()
plt.figure(figsize=(8, 8))
plt.pie(department_count, labels=department_count.index, autopct='%1.1f%%', startangle=140)
plt.title('Employee Distribution by Department')
plt.savefig('employee_distribution.png')
plt.show()

# 5. Сохранение обработанных данных в CSV-файлы
df_processed.to_csv('processed_data.csv', index=False)
print("Processed data saved to 'processed_data.csv'")

# Сохранение средней зарплаты по департаментам и полу
gender_department_salary.to_csv('average_salary_by_department_and_gender.csv', index=False)
print("Average salary by department and gender saved to 'average_salary_by_department_and_gender.csv'")

# Сохранение средней зарплаты по уровню образования и стажу работы
education_experience_salary.to_csv('average_salary_by_education_and_experience.csv', index=False)
print("Average salary by education level and experience years saved to 'average_salary_by_education_and_experience.csv'")

# Сохранение средней зарплаты по возрастным группам
age_group_salary.to_csv('average_salary_by_age_group.csv', index=False)
print("Average salary by age group saved to 'average_salary_by_age_group.csv'")

# Вывод обработанных данных
print("\nProcessed Data:")
print(df_processed)
print("\nAverage Salary by Department and Gender:")
print(gender_department_salary)
print("\nAverage Salary by Education Level and Experience Years:")
print(education_experience_salary)
print("\nAverage Salary by Age Group:")
print(age_group_salary)