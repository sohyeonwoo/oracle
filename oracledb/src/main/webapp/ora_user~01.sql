select * from employees;
select hire_date,sysdate,round(sysdate-hire_date) from employees; 
-- [sysdate - hire_date] : ���糯¥���� ���� ��¥������ �Ⱓ.

select  distinct  department_id from employees order by department_id asc;
-- distinct �ߺ��� �����ϱ� ���� ��ɾ�

select * from departments;

desc stuscore;

select emp_name from employees;

--���� , ���̺��, �÷��� �� ��ҹ��� ���о���
select emp_name from employees where emp_name = 'Donald OConnell';
