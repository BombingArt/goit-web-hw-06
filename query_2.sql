select s.student_id, s.student_name, avg(g.grade) as average_grade
from students s
join grades g on s.student_id = g.student_id
join subjects subj on g.subject_id = subj.subject_id
where subj.subject_name = 'Geography' -- Вставити будь-який предмет
group by s.student_id, s.student_name
order by average_grade desc
limit 1;
