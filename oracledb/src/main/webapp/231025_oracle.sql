select * from employees;
select salary,salary+100,salary-100 from employees;
select sysdate,sysdate+365 from dual; --dual �ӽô������̺�
select 1+3 from dual;
-- ���� '3'�� ��Ģ������ �ϸ� ���ڷ� �ڵ���ȯ
select 1+'3' from dual;
-- ���� 'a'�� ��Ģ���� �ϸ� ����
select 1+'a' from dual;
-- ���ڴ� ��Ģ������ �Ҽ� ����.
select 'a'+'b' from dual;
-- ���� ������ ||, concat��ɾ�
select 'a'||'b' from dual;
select concat('a','b') from dual;
select * from employees;
-- emp_name(email) �̷��� ����Ͻÿ�.
-- ��������(onulee)
-- Donald OConnell(DOCONNEL)
select emp_name||'('||email||')' u_nicId from employees;
select concat(emp_name,concat('(',concat(email,')'))) from employees;
select employee_id,emp_name,hire_date from employees
order by hire_date asc
;
-- 00/01/01 ���� �Ի��� ����� ����Ͻÿ�.
-- 00/01/24, 00-01-01, 2000-01-01 ���� ������.
select * from employees
where hire_date >= '00-01-01'
order by hire_date asc
;
select * from employees
order by salary desc
;
select max(salary) from employees;
--24000
select * from employees
where salary = 24000
;
select * from employees
where salary=(select max(salary) from employees)
;
select * from employees
where commission_pct is not null
;
-- �μ���ȣ�� 80�� �̻��� ����� ����Ͻÿ�.
select * from employees
where department_id >=80
order by department_id asc
;
-- �μ���ȣ 80�� �����ϰ� ����Ͻÿ�.
select * from employees
where not department_id = 80
order by department_id asc
;
-- <> != not
select * from employees
where department_id != 80
order by department_id asc
;
-- �μ���ȣ�� 50���̸鼭 6000�̻��� ����� ����Ͻÿ�.
select * from employees
where department_id=50 and salary>=6000;

--������ 2000�� �̻� 3000���� ���� (����1) and  ����
select * from employees
where salary >=2000 and salary <=3000;

--������ 2000�� �̻� 3000���� ���� (����2) between a and b
select * from employees
where salary between 2000 and 3000;

select avg(salary) from employees; --avg��� �׷��Լ� 6461�޷�

select * from employees
where salary <=(select avg(salary) from employees) 
order by salary desc;

select * from employees
where salary =3000 or salary = 4000 or salary = 6000;

select * from employees
where salary in(3000,4000,6000);

select * from employees
where employee_id in(101,151,200)
order by salary desc;

select employee_id , salary from employees
where employee_id = 101 or employee_id = 151  or employee_id = 200;

--2000�̸� 3000�ʰ�

select * from employees
where salary <2000 or salary >3000;

select * from employees
where salary not between 2000 and 3000;

--�Ի����� 00/01/01 - 00/12/31

select * from employees
where hire_date between '00/01/01' and '00/12/31';

select emp_name from employees;

--1 �̸��� �빮�� S �� ���۵Ǵ� �̸� ���
select emp_name from employees
where emp_name like 'S%';
--2 �̸��� �ҹ��� n���� ������ �̸����
select emp_name from employees
where emp_name like '%n';
--3 ó��,��,�߰� e�� �� �̸� ���
select emp_name from employees
where emp_name like '%e%';

select count(*) from board;

drop table board;

select * from board;
--bcontent faucibus �ܾ �� �ִ� �Խñ��� ����Ͻÿ�
select * from board
where bcontent like '%faucibus%';

---bcontent �Ǵ� btitle 'ven' , btitle bcontent 'ven'
select * from board
where bcontent like '%ven%'; --256��

select * from board where btitle like '%ven%'; --15��

select * from board where btitle like '%ven%' or bcontent like '%ven%' --270��

--bcontent 'n'���� �����ϸ鼭 4���� ���� �ܾ �ִ� �Խñ��� ����Ͻÿ�
select * from board where bcontent like 'n___ %';


select emp_name from employees
where emp_name like 'P__ %';

select emp_name from employees
where emp_name like'%A%' --14�� �̸��߿� 'A'�� �߰��� ���� �̸��� ����

select emp_name from employees
where emp_name like'D%';--9�� �̸��߿� 'D' �� ���۵Ǵ� �̸��� ����

select emp_name from employees
where emp_name like'%a%'; -- 83�� //�̸��߿� �߰��� 'a'�� ���� �̸� ����

--�ι�° ���ڰ� 'a'�� ����̸��� ����Ͻÿ�
select emp_name from employees
where emp_name like'_a%';

--������ ������ ����
select * from employees
order by salary asc;

select employee_id,emp_name,job_id,hire_date from employees
order by emp_name desc;

-- �μ���ȣ�� �������� , �̸��� ��������
select * from employees
select employee_id , emp_name , department_id , job_id , hire_date , salary from employees
order by department_id asc , emp_name desc;

--�������� ��������, �Ի��Ϸ� ��������
select employee_id , emp_name , department_id , job_id , hire_date , salary from employees
order by salary asc , hire_date desc;


--abs : ���밪
select -10, abs(-10) "���밪" from dual;

--floor : ����
select 10.54578, floor(10.54578) from dual;

--trunc : Ư���ڸ����� ����
select 10.54578 , trunc(10.54578 , 2) from dual;

--round : Ư���ڸ� �ݿø�
select 10.54578 , round(10.54578 , 3) from dual;

select * from stuscore;
select stunum,name,kor,eng,kor+eng,(kor+eng)/2 from stuscore;

--������ ��ȭ�� ȯ�� 1342 �� �Ҽ��� 2�ڸ� �ݿø� // round - 2 �� ���� 2��° �ڸ����� �ݿø�

select employee_id"�μ�" , emp_name"�̸�" , salary"����" , salary*1342.32 "��ȭ����" , round(salary*1342.32 ) "�ݿø�" from employees

--�Ի����� ���糯¥���� �ɸ� ���ڸ� ����Ͻÿ�
select round(sysdate - hire_date , 2)"�ٷ��ϼ�" from employees;

--�Ի��Ͽ��� ���糯¥���� �ɸ� ���ڸ� ����Ͻÿ� - �Ҽ��� �ڸ��� �ݿø��ϰ� ���� ������ ȯ���Ͻÿ�
select round(sysdate - hire_date)"�ٷ���" ,round((sysdate - hire_date)/365 ) "������ ȯ��"  from employees
order by hire_date desc;

select * from member;

select *from employees;

--������ �Լ� : mod
select mod(27 , 2) , mod(27 , 5) , mod(27,7) from dual;

--employees ����� Ȧ���� ����� ����Ͻÿ�
select * from employees
where mod(employee_id,2) =1
order by employee_id asc;

--�μ���ȣ�� ¦���� ����� ����Ͻÿ�
select employee_id , emp_name , hire_date , salary , manager_id , department_id from employees
where mod(manager_id,2)=0
order by manager_id asc;

select bhit from board;

select avg(bhit) from board;


--��� ��ȸ���� 2�ڸ����� �ݿø� ���
select  round(avg(bhit),2) from board;

--��� ��ȸ�� �Ҽ��� ����
select  floor(avg(bhit)) from board;
--��չ޾� ���� ��ȸ���� ���� �Խñ� ���
select * from board
where bhit >= (select avg(bhit) from board);

-- to char : ����ȯ �����ִ� ����
select to_char( salary,'999,999') , round(salary*1342.32) from employees;

--������
create sequence member_seq
start with 1 
increment by 1
minvalue 1
maxvalue 99999
nocycle
nocache;

create sequence board_seq
start with 1001 
increment by 1
minvalue 1
maxvalue 99999
nocycle
nocache;

select * from board order by bno desc;

select board_seq.currval from dual;
select board_seq.nextval from dual;

insert into board values(board_seq.nextval,'�����Դϴ�.','�����Դϴ�.',sysdate,'aaa',board_seq.currval,0,0,1,'1.jpg');
commit;

--dept_seq ������ 10,���� 10

create sequence dept_seq2
start with 10
increment by10
minvalue 1
maxvalue 99999
nocycle
nocache;

select dept_seq.nextval from dual;

desc stuscore;

select * from stuscore;
--delete stuscore;
commit;


select * from stuscore order by total desc;

select stunum,rank,rank () over(order by total desc) m_rank
from stuscore ;

update stuscore set rank =1
where stunum = 1;

select stunum,rank() over(order by total desc) from stuscore
where stunum=1;

select * from stuscore;

select * from stuscore a,member b;

select employees.department_id,dempart_name,parent_id from employees a,departments b
where employees,department_id = departments,department_id;

----------emp2
select * from emp2;

update emp2 set manager_id = '';

drop table emp2;

create table emp2 as select * from employees;
select * from emp2;
update emp2 set manager_id='';
commit;

select*from emp2;

select * from employees;


--1 . emp2�� �����ȭ�� employees �����ȣ �Ȱ��� ��ġ��Ų��.
--2. emp2 �� ������ ��ȣ�� employees ������ ��ȣ�� �˻��Ѵ�.
--3. employees ������ ��ȣ�� emp2 �� ������ ��ȣ�� �Է½�Ų��.
update (select a.manager_id a_m , b.manager_id b_m
from emp2 a,employees b
where a.employee_id = b.employee_id) 
set a_m = b_m; 

set emp2.manager_id = employee.manager_id ;

select a.manager_id a_m , b.manager_id b_m
from emp2 a,employees b
where a.employee_id = b.employee_id;


update emp2 set manager_id =1;

select salary from employees
where salary >= (select avg(salary)from employees);

update stuscore a
set rank = ( -- select stunum,rank from stuscore
select b_rank from
(select stunum b_num, rank() over (order by total desc) as b_rank from stuscore) b
where a.stunum = b.b_num
);
select total,rank from stuscore
order by total desc;

commit;

select * from stuscore;

CREATE SEQUENCE emp01_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
MINVALUE 1
NOCYCLE
NOCACHE;

create table emp01(
empno number(4) primary key,
ename varchar2(10),
hiredate date);

drop table emp01;
commit;

insert into emp01 values (emp_seq.nextval,'ȫ�浿',sysdate);
insert into emp01 values (emp_seq.nextval,'������',sysdate);
insert into emp01 values (emp_seq.nextval,'�̼���',sysdate);
insert into emp01 values (emp_seq.nextval,'ȫ����',sysdate);


select * from emp01;


















select department_id,department_name from departments;

;
update stuscore a 
set rank = 1


where stunum = 1;
















