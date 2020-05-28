
--STUDENT 1111111111 REGISTER TO A UNLIMITED COURSE SHOULD WORK
INSERT INTO Registrations VALUES ('1111111111','CCC111');

--STUDENT 1111111111 REGISTERS AGAIN SHOULD FAIL HE IS ALREADY REGISTERED
INSERT INTO Registrations VALUES ('1111111111','CCC111');

--STUDENT 1111111111 REGISERS TO A LIMITED COURSE THAT HE HASNT DONE THE Prerequisite COURSES SHOULD FAIL
INSERT INTO Registrations VALUES ('1111111111','CCC222');

--STUDENT 1111111111 REMOVED FROM COURSE WITHOUT WAITING LIST SHOULD WORK
DELETE FROM Registrations WHERE STUDENT = '1111111111' AND COURSE = 'CCC111';

--STUDENT 4444444444 REGISTERS FOR COURSE CCC111 SHOULD FAIL AND SAY THAT STUDENT ALREADY PASSED
INSERT INTO Registrations VALUES ('4444444444','CCC111');

--STUDENT 5555555555 REGISTERS TO A LIMITED COURSE THAT HE HAS DONE ALL THE PREREQUISITE COURSES SHOULD WORK
INSERT INTO Registrations VALUES ('5555555555','CCC222');

--STUDENT 6666666666 REGISTERS TO COURSE CCC222 THAT IS FULL AND SHOULD PUT HIM ON WAITING LIST
INSERT INTO Taken VALUES('6666666666','CCC111','5');
INSERT INTO Registrations VALUES ('6666666666','CCC222');

--STUDENT 3333333333 REGISTERS TO COURSE CCC222 THAT IS FULL AND SHOULD PUT HIM ON WAITING LIST
INSERT INTO Taken VALUES('3333333333','CCC111','5');
INSERT INTO Registrations VALUES ('3333333333','CCC222');

--REMOVING STUDENT 5555555555 FROM COURSE WITH WAITINGLIST SHOULD REMOVE HIM FROM COURSE AND REGISTER STUDENT 6666666666 TO COURSE CCC222 AND ADJUST THE POSISTIONS ON WAITINGLIST
DELETE FROM Registrations WHERE STUDENT = '5555555555' AND COURSE = 'CCC222';

--REMOVING STUDENT FROM WAITINGLIST POS = 1 SHOULD MOVE STUDENT 5555555555 TO POS 1 INSTEAD OF POS 2
INSERT INTO Registrations VALUES ('5555555555','CCC222');
DELETE FROM Registrations WHERE STUDENT = '3333333333' AND COURSE = 'CCC222';

--REMOVE FROM AN OVERFULL COURSE SHOULD PUT ALL BUT 2 STUDENT TO WAITINGLIST AND DONT REGISTER THEM AFTER REMOVING ONE STUDENT FROM THE OVERFULL COURSE
INSERT INTO Taken VALUES('6666666666','CCC444','5');
INSERT INTO Taken VALUES('1111111111','CCC444','5');
INSERT INTO Taken VALUES('3333333333','CCC444','5');

INSERT INTO LimitedCourses VALUES ('CCC555',1);
UPDATE LimitedCourses SET CAPACITY = 2 WHERE CODE = 'CCC555';
INSERT INTO Registrations VALUES ('5555555555','CCC555');
INSERT INTO Registrations VALUES ('3333333333','CCC555');
INSERT INTO Registrations VALUES ('6666666666','CCC555');
INSERT INTO Registrations VALUES ('1111111111','CCC555');
UPDATE LimitedCourses SET CAPACITY = 1 WHERE CODE = 'CCC555';
DELETE FROM Registrations WHERE STUDENT = '3333333333' AND COURSE = 'CCC555';
