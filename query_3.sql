select g.group_id, g.group_name, avg(grades.grade) as average_grade
from groups g
join students s on g.group_id = s.group_id
join grades on s.student_id = grades.student_id
join subjects on grades.student_id = subjects.subject_id
where subjects.subject_name = 'Geography' -- Вставити будь-який предмет
group by g.group_id, g.group_name;