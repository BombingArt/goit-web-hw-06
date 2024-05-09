select distinct subject_name
from subjects
join grades on subjects.subject_id = grades.subject_id 
join students on grades.student_id = students.student_id 
join teachers on subjects.teacher_id = teachers.teacher_id 
where students.student_name = 'Jessica Munoz' -- Вставити ім'я студента
and teachers.teacher_name = 'Anthony Bradshaw'; -- Вставити ім'я викладача