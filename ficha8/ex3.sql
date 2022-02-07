DROP VIEW DEPARTMENT_STAFF;

CREATE VIEW DEPARTMENT_STAFF(DName,SName,Job)
AS
SELECT DEPARTMENT.Name AS DName, STAFF.Name AS SName, STAFF.Job AS Job
FROM DEPARTMENT
JOIN STAFF ON (DEPARTMENT.Manager = STAFF.StaffId
  OR DEPARTMENT.Manager = STAFF.Supervisor);