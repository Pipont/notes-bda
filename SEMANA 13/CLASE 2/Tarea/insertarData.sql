USE ENormalizacion01;


INSERT INTO Faculties (f_name, f_phone) VALUES ('Faculty 1', 1234567890);
INSERT INTO Faculties (f_name, f_phone) VALUES ('Faculty 2', 9876543210);
INSERT INTO Faculties (f_name, f_phone) VALUES ('Faculty 3', 1234567890);


INSERT INTO Courses (cid, c_name, fid) VALUES ('C001', 'Course 1', 1);
INSERT INTO Courses (cid, c_name, fid) VALUES ('C002', 'Course 2', 2);
INSERT INTO Courses (cid, c_name, fid) VALUES ('C003', 'Course 3', 3);
INSERT INTO Courses (cid, c_name, fid) VALUES ('C004', 'Course 4', 1);
INSERT INTO Courses (cid, c_name, fid) VALUES ('C005', 'Course 5', 2);
INSERT INTO Courses (cid, c_name, fid) VALUES ('C006', 'Course 6', 3);

INSERT INTO Students (s_name) VALUES ('Student 1');
INSERT INTO Students (s_name) VALUES ('Student 2');
INSERT INTO Students (s_name) VALUES ('Student 3');
INSERT INTO Students (s_name) VALUES ('Student 4');
INSERT INTO Students (s_name) VALUES ('Student 5');
INSERT INTO Students (s_name) VALUES ('Student 6');

INSERT INTO Courses_Grades (sid, cid, grade) VALUES (1, 'C001', 90);
INSERT INTO Courses_Grades (sid, cid, grade) VALUES (2, 'C002', 85);
INSERT INTO Courses_Grades (sid, cid, grade) VALUES (3, 'C003', 80);
INSERT INTO Courses_Grades (sid, cid, grade) VALUES (4, 'C004', 75);
INSERT INTO Courses_Grades (sid, cid, grade) VALUES (5, 'C005', 70);
INSERT INTO Courses_Grades (sid, cid, grade) VALUES (6, 'C006', 65);
