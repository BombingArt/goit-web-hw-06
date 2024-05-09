select student_name
from students
where group_id = (select group_id 
	from groups 
	where group_name = 'Mudlogger' -- Вставити назву групи
);