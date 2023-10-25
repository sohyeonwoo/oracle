select * from departments;

select * from departments order by manager_id asc;

select * from employees;

select * from employees order by employee_id asc; --��������

select * from employees order by employee_id desc; --��������

select * from employees where employee_id >=200;

select * from employees
where employee_id >=190 and employee_id <=205;

select * from employees
where salary >=5000 order by salary asc;

--���,�̸�,����,�μ� ���

select employee_id,emp_name,job_id,department_id,salary from employees;

--���̺��� ��Ƽ�� ����
create table emp2 as select * from employees;

select * from emp2;

desc emp2;

--�÷��̸� ����
alter table emp2 rename column emp_name to e_name;

alter table emp2 modify email number(50);
--�÷�����
alter table emp2 drop column create_date;
--Į�� �߰�
alter table emp2 add create_date date;

--�÷���������
alter table emp2 modify update_date invisible;
alter table emp2 modify update_date visible;
select * from emp2;

--�ķ��� �����͸� ����
insert into emp2 select * from employees;

select * from emp2;

select emp_name,salary,hire_date from emp2 order by emp_name asc;

alter table emp2 modify salary invisible;


alter table emp2 modify job_id visible;

desc emp2;

--��Ī ���� as ���� ���̴°�
select salary,salary*12 as y_salary, salary*12*1342 as ky_salary from employees;

select * from employees;

--����
select aslary , salary*12 from employees;

select salary , 
salary *12 as "����",
(salary*12)*nvl(commission_pct,0) as "�μ�Ƽ��",
(salary*12)+(salary*12)*nvl(commission_pct,0) as"��������" from employees;

--null���� 0���� ǥ���ϴ� ��� nvl�Լ��� ���´�.
select nvl(manager_id,0) from employees;

--��� , ���� , ���� , Ŀ�̼� , ���� , ����+Ŀ�̼� �� ����Ͻÿ�.

select employee_id , salary ,salary*12 y_salary, (salary*12)+(salary*12)*nvl(commission_pct,0) c_salary from employees;

--������ 6000�� ��� �˻�
select * from employees where salary=6000;

--Ŀ�̼��� null(����) ����� ����Ͻÿ�
select * from employees where commission_pct = null; --�˻��ȵ� : ��� �ȵ�
select*from employees where commission_pct is null; --�˻����� is �ٿ����� //Ŀ�̼��� ���»��
select*from employees where commission_pct is not null; --Ŀ�̼��� �ִ� ����� �˻�

select commission_pct from employees;

--�μ���ȣ , �μ����� �����ϰ� �μ���ȣ�� 10���� ũ�� 40���� �۰� ���
select   department_id "�μ���ȣ" ,  department_name "�μ���"  from departments 
where department_id >= 10 and department_id <= 40;

select emp_name||'is a'||salary from employees;
select concat(concat(emp_name,'is a'),job_id) con_name from employees;

select * from stuscore;

select avg from stuscore;



select distinct department_id from employees
order by department_id asc;

--job_id �ߺ����� ����Ͻÿ�.
select distinct job_id from employees
order by job_id asc;

--������ 3000,5000,6000�� ����� ����Ͻÿ�

select * from employees
where salary = 3000 or salary = 5000 or salary = 6000
order by salary desc;

SELECT salary, salary+1000,(salary+1000)*1342 "��ȭ" 
from employees
where salary <=5000
order by salary desc;

--�μ���ȣ�� 10�� 30�� 50�� �� ����� �����ȣ, ����̸� , �μ���ȣ , ���� ,����,�Ի����� ����Ͻÿ�
select * from employees;

select employee_id, emp_name, department_id, job_id, salary, hire_date
from employees
where DEPARTMENT_ID=10 or DEPARTMENT_ID=30 or DEPARTMENT_ID = 50
order by department_id desc;

select * from employees order by employee_id;

select * from employees;

--������ 4õ�޷� �̻� 8õ�޷� �̸��� ����� �����ȣ�� ��������
select employee_id, emp_name, department_id, job_id, salary, hire_date 
from employees
where salary >=4000 and salary <=8000 and
hire_date > '03/09/01'
order by employee_id desc;
commit;




