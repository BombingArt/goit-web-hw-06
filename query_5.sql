select subject_name
from subjects
where teacher_id = (select teacher_id 
	from teachers
	where teacher_name = 'Elizabeth Burns' -- Вставити ім'я викладача
); 