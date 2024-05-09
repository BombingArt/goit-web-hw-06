-- Table: students
drop table if exists students;
create table students (
    student_id integer primary key autoincrement,
    student_name varchar(255) not null,
    group_id integer not null,
    foreign key(group_id) references groups(id)
);

-- Table: groups
drop table if exists groups;
create table groups (
    group_id integer primary key autoincrement,
    group_name varchar(255) not null
);

--Table: teachers
drop table if exists teachers;
create table teachers (
    teacher_id integer primary key autoincrement,
    teacher_name varchar(255) not null
);

--Table: subjects
drop table if exists subjects;
create table subjects (
    subject_id integer primary key autoincrement,
    subject_name varchar(255) not null,
    teacher_id integer not null,
    foreign key(teacher_id) references teachers(teacher_id)
);

--Table: grades
drop table if exists grades;
create table grades (
    grade_id integer primary key autoincrement,
    student_id integer,
    subject_id integer,
    grade integer,
    grade_date date,
    foreign key(student_id) references students(student_id),
    foreign key(subject_id) references subjects(subject_id)
);
    