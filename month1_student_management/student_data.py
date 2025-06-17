# function to collect student info from the user.
students = []

def add_student():
    name = input("Enter student name: ")
    age = input("Enter student age: ")
    grade = input("Enter student grade: ")

    student = {
        "name": name,
        "age": age,
        "grade": float(grade)
    }

    students.append(student)
    print("Student added!\n")

#function to display all students.

def view_students():
    if len(students) == 0:
        print("No students yet.\n")
    else:
        for student in students:
            print("Name:", student["name"])
            print("Age:", student["age"])
            print("Grade:", student["grade"])
            print()

#return the average grade of all students.
def get_average_grade():
    if len(students) == 0:
        print("No students added yet.\n")
    else:
        total = 0
        for student in students:
            total += student["grade"]
        average = total / len(students)
        print("Average grade:", average, "\n")


