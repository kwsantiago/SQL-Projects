# 6. Notice what value is set for the nickname field.
The values for all the nicknames are set to NULL.

# 7a. What value is used for the middle field when there is no middle name/initial?
The middle fields have an empty string when there is no middle name/initial.
The value using "select *, ord(middle) from students" is 0 when there is no middle name/initial. This value is different from the empty string since it is the numeric value of the leftmost character of the given string. In this case the string is empty, so the value is 0.

# 7b. Write a SELECT statement that will select only those students who do not have a middle name/initial.
select middle from students where middle = '';

# 9. Write a SQL statement to delete all the records from the students table.
DELETE FROM students;

# 10. "Fixed" LOAD DATA INFILE statement
LOAD DATA LOCAL INFILE 'D:/Downloads/snames.csv'
INTO TABLE students
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
(lname, fname, @middle)
set middle=nullif(@middle, '');

# 12. Write an INSERT statement to insert your name into the database.
insert into students
(lname, fname)
values
('Santiago', 'Kyle');

# 13a. Create nickname using INSERT / DELETE statements

delete from students where lname = 'Santiago' and fname = 'Kyle';

insert into students
(lname, fname, nickname)
values
('Santiago', 'Kyle', 'Twix');

# 13b. Create nickname using UPDATE statement
update students
set nickname = 'Fishing Rod'
where lname = 'Wilkinson' and fname = 'Rod';

# 14. A single UPDATE statement to set middle name / initial and nickname to different values
update students
set nickname = 'Sassy Sandra', middle = 'M'
where lname = 'Milford' and fname = 'Sandra';