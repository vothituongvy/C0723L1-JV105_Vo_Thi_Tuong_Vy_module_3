use quanlysinhvien;
-- c1
select *
from subject
where Credit=(select max(Credit) from subject);
-- c2
select s.*, m.Mark 
from subject s join mark m on s.Subid = m.Subid
having m.Mark >= all (select mark from mark);
-- c3
select s.*,avg(m.Mark) as diem_trung_binh
from student s
join mark m on s.StudentId=m.StudentId
group by s.StudentId,s.StudentName
order by diem_trung_binh desc