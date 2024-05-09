select distinct subject_name
from subjects
join grades on subjects.subject_id = grades.subject_id
join students on grades.student_id = students.student_id 
where students.student_name = 'Jessica Munoz'; -- Вставити ім'я студента