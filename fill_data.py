import faker
from random import randint, choice
import sqlite3

NUMBER_STUDENTS = 34
NUMBER_GROUPS = 3
NUMBER_SUBJECTS = 6
NUMBER_TEACHERS = 5
NUMBER_GRADES = 20

subject_words = ["Mathematics", "Physics", "Chemistry", "Biology", "History", "Literature", "Geography", "Art", "Music", "Computer Science"]


def generate_fake_data(number_students, number_groups, number_subjects, number_teachers, number_grades) -> tuple:
    fake = faker.Faker()
    unique_subjects = list(set(choice(subject_words) for _ in range(number_subjects)))
    fake_students = [(fake.name(), randint(1, number_groups)) for _ in range(number_students)]
    fake_groups = [(fake.job(), ) for _ in range(number_groups)]
    fake_teachers = [(fake.name(), ) for _ in range(number_teachers)]
    fake_grades = [(randint(1, number_students), randint(1, number_subjects), randint(1, 100), fake.date_time_this_decade()) for _ in range(number_grades)]

    # Создаем список предметов с использованием реальных идентификаторов преподавателей
    fake_subjects = []
    for subject in unique_subjects:
        # Выбираем случайного преподавателя
        teacher_id = randint(1, number_teachers)
        fake_subjects.append((subject, teacher_id))

    return (fake_students, fake_groups, fake_teachers, fake_subjects, fake_grades)



def insert_data_to_db(students, groups, teachers, subjects, grades):
    with sqlite3.connect('hw-06.db') as con:
        cur = con.cursor()
        cur.executemany('INSERT INTO students (student_name, group_id) VALUES (?, ?)', students)
        cur.executemany('INSERT INTO groups (group_name) VALUES (?)', groups)
        cur.executemany('INSERT INTO teachers (teacher_name) VALUES (?)', teachers)
        cur.executemany('INSERT INTO subjects (subject_name, teacher_id) VALUES (?, ?)', subjects)
        cur.executemany('INSERT INTO grades (student_id, subject_id, grade, grade_date) VALUES (?, ?, ?, ?)', grades)
        con.commit()

if __name__ == "__main__":
    students, groups, teachers, subjects, grades = generate_fake_data(NUMBER_STUDENTS, NUMBER_GROUPS, NUMBER_SUBJECTS, NUMBER_TEACHERS, NUMBER_GRADES)
    insert_data_to_db(students, groups, teachers, subjects, grades)
