select avg(grade) as average_grade
from grades
join subjects on grades.subject_id = subjects.subject_id
where subjects.subject_id = (select teacher_id 
    from teachers 
    where teacher_name = 'Elizabeth Burns' -- Вставити ім'я викладача
);