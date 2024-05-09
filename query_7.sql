select student_name, grade
from students
join  grades on students.student_id = grades.student_id 
join subjects on grades.subject_id = subjects.subject_id 
where students.group_id = (select group_id
	from groups
	where group_name = 'Mudlogger' -- Вставити назву групи
);