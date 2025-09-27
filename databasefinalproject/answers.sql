-- Creating a Database
CREATE DATABASE my_final_project;
USE my_final_project;

--Departments Table (One-to-Many with Students)
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) UNIQUE NOT NULL
);

--Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department_id INT,
    CONSTRAINT fk_student_department FOREIGN KEY (department_id) 
        REFERENCES Departments(department_id)
);

-- StudentProfiles (One-to-One with Students)
CREATE TABLE StudentProfiles (
    profile_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT UNIQUE,
    date_of_birth DATE NOT NULL,
    address VARCHAR(200),
    phone_number VARCHAR(15) UNIQUE,
    CONSTRAINT fk_profile_student FOREIGN KEY (student_id) 
        REFERENCES Students(student_id)
);

-- Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) UNIQUE NOT NULL,
    credits INT NOT NULL
);

-- StudentCourses (Many-to-Many between Students & Courses)
CREATE TABLE StudentCourses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    CONSTRAINT fk_sc_student FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT fk_sc_course FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Hobbies Table
CREATE TABLE Hobbies (
    hobby_id INT PRIMARY KEY AUTO_INCREMENT,
    hobby_name VARCHAR(100) UNIQUE NOT NULL
);

-- StudentHobbies (Many-to-Many between Students & Hobbies)
CREATE TABLE StudentHobbies (
    student_id INT,
    hobby_id INT,
    PRIMARY KEY (student_id, hobby_id),
    CONSTRAINT fk_sh_student FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT fk_sh_hobby FOREIGN KEY (hobby_id) REFERENCES Hobbies(hobby_id)
);

-- Inserting data

-- Departments
INSERT INTO Departments (department_name) VALUES
('Computer Science'), ('Mathematics'), ('Physics');

-- Students
INSERT INTO Students (first_name, last_name, email, department_id) VALUES
('Fay', 'Baker','faybaker@gmail.com', 1),
('Kim', 'Eung', 'kimeung@gnail.com', 2),
('Park', 'Sojun', 'parksojun@gmail.com', 1),
('Olivia', 'Hunter', 'oliviahunter@gmail.com', 2);


-- StudentProfiles
INSERT INTO StudentProfiles (student_id, date_of_birth, address, phone_number) VALUES
(1, '2002-05-15', '123 Main St', '0712345678'),
(2, '2001-09-20', '456 San Rd', '0798765432'),
(3, '2003-01-10', '789 Pine Ln', '0789123456'),
(4, '2002-05-20', '201 Sub Rd', '0731445782');

-- Courses
INSERT INTO Courses (course_name, credits) VALUES
('Database Systems', 3),
('Linear Algebra', 4),
('Physics I', 3),
('Web Development', 3);

-- StudentCourses
INSERT INTO StudentCourses (student_id, course_id) VALUES
(1, 1), (1, 4),
(2, 2),
(3, 1), (3, 3),
(4,2), (4, 4)

-- Hobbies
INSERT INTO Hobbies (hobby_name) VALUES
('Reading'), ('Football'), ('Coding'), ('Music');

-- StudentHobbies
INSERT INTO StudentHobbies (student_id, hobby_id) VALUES
(1, 1), (1, 3),
(2, 2),
(3, 3), (3, 4),
(4, 2), (4, 4);