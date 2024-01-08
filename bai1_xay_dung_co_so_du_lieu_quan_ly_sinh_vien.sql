create database `student_management`;
use `student_management`;
CREATE TABLE student (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);
CREATE TABLE Class (
    id INT PRIMARY KEY,
    `name` VARCHAR(50)
);
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);
INSERT INTO `student_management`.`student` (`id`, `name`, `age`, `country`) VALUES ('1', 'vy', '19', 'QuangNam');
INSERT INTO `student_management`.`class` (`id`, `name`) VALUES ('1', 'C0723L1-JV105');
INSERT INTO `student_management`.`teachers` (`id`, `name`, `age`, `country`) VALUES ('1', 'NguyenvanA', '40', 'DaNang');
