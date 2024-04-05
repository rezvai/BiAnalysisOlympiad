update jobs set name = lower(name) --- Преобразуем поле name нижний регистр

update jobs set description = lower(description) --- Преобразуем поле description нижний регистр

update jobs set region_name = lower(region_name) --- Преобразуем поле region_name нижний регистр

update jobs set main_skills = lower(main_skills) --- Преобразуем поле main_skills нижний регистр

update jobs set work_schedule = lower(work_schedule) --- Преобразуем поле work_schedule нижний регистр

update jobs set publication_date = trim(publication_date, '+0700 07') --- Удаляем лишние элменты из поля publication_date для дальнейшего преобраваония

update jobs set work_experience = '0' where work_experience = '6-' --- Заменяем значения из поля work_experience, где значение = '6-' на '0', видимо при импорте произошла ошибка и некоторые нули превратились в '6-'

select count(case when nullif(name, '') is null then 1 end) as empty,
	   count(case when nullif(name, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле name до обработки

select count(case when nullif(description, '') is null then 1 end) as empty,
	   count(case when nullif(description, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле description до обработки

select count(case when nullif(salary, 0) is null then 1 end) as empty,
	   count(case when nullif(salary, 0) is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле salary до обработки

select count(case when nullif(publication_date, NULL) is null then 1 end) as empty,
	   count(case when nullif(publication_date, NULL) is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле publication_date до обработки

select count(case when nullif(region_name, '') is null then 1 end) as empty,
	   count(case when nullif(region_name, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле region_name до обработки

select count(case when nullif(employer, '') is null then 1 end) as empty,
	   count(case when nullif(employer, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле employer до обработки

select count(case when nullif(main_skills, '') is null then 1 end) as empty,
	   count(case when nullif(main_skills, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле main_skills до обработки

select count(case when nullif(work_experience, '') is null then 1 end) as empty,
	   count(case when nullif(work_experience, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле work_experience до обработки

select count(case when nullif(work_schedule, '') is null then 1 end) as empty,
	   count(case when nullif(work_schedule, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле work_schedule до обработки

select count(case when nullif(name, '') is null then 1 end) as empty,
	   count(case when nullif(name, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле name до обработки

delete from jobs where salary = 0 --- Удаляем строки с 0-ми значениями в поле salary

select count(case when nullif(name, '') is null then 1 end) as empty,
	   count(case when nullif(name, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле name после обработки

select count(case when nullif(description, '') is null then 1 end) as empty,
	   count(case when nullif(description, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле description после обработки

select count(case when nullif(salary, 0) is null then 1 end) as empty,
	   count(case when nullif(salary, 0) is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле salary после обработки

select count(case when nullif(publication_date, NULL) is null then 1 end) as empty,
	   count(case when nullif(publication_date, NULL) is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле publication_date после обработки

select count(case when nullif(region_name, '') is null then 1 end) as empty,
	   count(case when nullif(region_name, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле region_name после обработки

select count(case when nullif(employer, '') is null then 1 end) as empty,
	   count(case when nullif(employer, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле employer после обработки

select count(case when nullif(main_skills, '') is null then 1 end) as empty,
	   count(case when nullif(main_skills, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле main_skills после обработки

select count(case when nullif(work_experience, '') is null then 1 end) as empty,
	   count(case when nullif(work_experience, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле work_experience после обработки

select count(case when nullif(work_schedule, '') is null then 1 end) as empty,
	   count(case when nullif(work_schedule, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле work_schedule после обработки

select count(case when nullif(name, '') is null then 1 end) as empty,
	   count(case when nullif(name, '') is not null then 1 end) as not_empty
from jobs j --- Выводим информацию о пустых строках в поле name после обработки

select length(name) / (select avg(length(name)) from jobs) as name_analysis,
	   length(description) / (select avg(length(description)) from jobs) as description_analysis,
	   salary / (select avg(salary) from jobs) as salary_analysis
from jobs j limit 10 --- Вывод анализа средних значений значимых атрибутов 

select id,
	   name, 
	   description,
	   salary,
	   publication_date, 
	   region_name,
	   employer, 
	   main_skills, 
	   work_experience,
	   work_schedule
 from jobs j 
 order by id --- Выводим всю получившуются таблицу  и сортируем по ключу
	   


