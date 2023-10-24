select * from employees;
select hire_date,sysdate,round(sysdate-hire_date) from employees; 
-- [sysdate - hire_date] : 현재날짜에서 고용된 날짜까지의 기간.

select  distinct  department_id from employees order by department_id asc;
-- distinct 중복을 방지하기 위한 명령어

select * from departments;

desc stuscore;

select emp_name from employees;

--변수 , 테이블명, 컬럼명 은 대소문자 구분안함
select emp_name from employees where emp_name = 'Donald OConnell';
