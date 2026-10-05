
CREATE DATABASE college;
USE college;
 Student table create
CREATE TABLE Student (
StudentID INT,
StudentName VARCHAR(50),
DepartmentID INT
);
 Data insert
INSERT INTO Student VALUES
(101, 'Arun', 10),
(102, 'Priya', 20),
(103, 'Karthik', 10);

SELECT * FROM Student;DELIMITER //

CREATE PROCEDURE display_students()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE sid INT;
DECLARE sname VARCHAR(50);
DECLARE did INT;

DECLARE student_cursor CURSOR FOR
SELECT StudentID, StudentName, DepartmentID
FROM Student;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN student_cursor;

read_loop: LOOP

FETCH student_cursor INTO sid, sname, did;

IF done THEN
LEAVE read_loop;
END IF;

SELECT sid AS StudentID,
sname AS StudentName,
did AS DepartmentID;

END LOOP;

CLOSE student_cursor;
END //

DELIMITER ;

CALL display_students();


