select * from employees;
select salary,salary+100,salary-100 from employees;
select sysdate,sysdate+365 from dual; --dual 임시더미테이블
select 1+3 from dual;
-- 문자 '3'을 사칙연산을 하면 숫자로 자동변환
select 1+'3' from dual;
-- 문자 'a'는 사칙연산 하면 에러
select 1+'a' from dual;
-- 문자는 사칙연산을 할수 없음.
select 'a'+'b' from dual;
-- 문자 결합은 ||, concat명령어
select 'a'||'b' from dual;
select concat('a','b') from dual;
select * from employees;
-- emp_name(email) 이렇게 출력하시오.
-- 운이조아(onulee)
-- Donald OConnell(DOCONNEL)
select emp_name||'('||email||')' u_nicId from employees;
select concat(emp_name,concat('(',concat(email,')'))) from employees;
select employee_id,emp_name,hire_date from employees
order by hire_date asc
;
-- 00/01/01 이후 입사한 사원을 출력하시오.
-- 00/01/24, 00-01-01, 2000-01-01 같은 형태임.
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
-- 부서번호가 80번 이상인 사원을 출력하시오.
select * from employees
where department_id >=80
order by department_id asc
;
-- 부서번호 80만 제외하고 출력하시오.
select * from employees
where not department_id = 80
order by department_id asc
;
-- <> != not
select * from employees
where department_id != 80
order by department_id asc
;
-- 부서번호가 50번이면서 6000이상인 사원을 출력하시오.
select * from employees
where department_id=50 and salary>=6000;

--월급이 2000원 이상 3000만원 이하 (구문1) and  구문
select * from employees
where salary >=2000 and salary <=3000;

--월급이 2000원 이상 3000만원 이하 (구문2) between a and b
select * from employees
where salary between 2000 and 3000;

select avg(salary) from employees; --avg평균 그룹함수 6461달러

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

--2000미만 3000초과

select * from employees
where salary <2000 or salary >3000;

select * from employees
where salary not between 2000 and 3000;

--입사일이 00/01/01 - 00/12/31

select * from employees
where hire_date between '00/01/01' and '00/12/31';

select emp_name from employees;

--1 이름이 대문자 S 로 시작되는 이름 출력
select emp_name from employees
where emp_name like 'S%';
--2 이름이 소문자 n으로 끝나는 이름출력
select emp_name from employees
where emp_name like '%n';
--3 처음,끝,중간 e가 들어간 이름 출력
select emp_name from employees
where emp_name like '%e%';

select count(*) from board;

drop table board;

select * from board;
--bcontent faucibus 단어가 들어가 있는 게시글을 출력하시오
select * from board
where bcontent like '%faucibus%';

---bcontent 또는 btitle 'ven' , btitle bcontent 'ven'
select * from board
where bcontent like '%ven%'; --256개

select * from board where btitle like '%ven%'; --15개

select * from board where btitle like '%ven%' or bcontent like '%ven%' --270개

--bcontent 'n'으로 시작하면서 4개의 문자 단어가 있는 게시글을 출력하시오
select * from board where bcontent like 'n___ %';


select emp_name from employees
where emp_name like 'P__ %';

select emp_name from employees
where emp_name like'%A%' --14개 이름중에 'A'가 중간에 들어가는 이름의 개수

select emp_name from employees
where emp_name like'D%';--9개 이름중에 'D' 로 시작되는 이름의 갯수

select emp_name from employees
where emp_name like'%a%'; -- 83개 //이름중에 중간에 'a'가 들어가는 이름 갯수

--두번째 글자가 'a'인 사원이름을 출력하시오
select emp_name from employees
where emp_name like'_a%';

--월급을 낮은순 부터
select * from employees
order by salary asc;

select employee_id,emp_name,job_id,hire_date from employees
order by emp_name desc;

-- 부서번호는 순차정렬 , 이름은 역순정렬
select * from employees
select employee_id , emp_name , department_id , job_id , hire_date , salary from employees
order by department_id asc , emp_name desc;

--월급으로 순차정렬, 입사일로 역순정렬
select employee_id , emp_name , department_id , job_id , hire_date , salary from employees
order by salary asc , hire_date desc;


--abs : 절대값
select -10, abs(-10) "절대값" from dual;

--floor : 버림
select 10.54578, floor(10.54578) from dual;

--trunc : 특정자리에서 버림
select 10.54578 , trunc(10.54578 , 2) from dual;

--round : 특정자리 반올림
select 10.54578 , round(10.54578 , 3) from dual;

select * from stuscore;
select stunum,name,kor,eng,kor+eng,(kor+eng)/2 from stuscore;

--월급을 원화로 환산 1342 원 소수점 2자리 반올림 // round - 2 는 정수 2번째 자리에서 반올림

select employee_id"부서" , emp_name"이름" , salary"월급" , salary*1342.32 "원화월급" , round(salary*1342.32 ) "반올림" from employees

--입사일이 현재날짜까지 걸린 일자를 출력하시오
select round(sysdate - hire_date , 2)"근로일수" from employees;

--입사일에서 현재날짜까지 걸린 일자를 출력하시오 - 소수점 자리는 반올림하고 일을 년으로 환산하시오
select round(sysdate - hire_date)"근로일" ,round((sysdate - hire_date)/365 ) "년으로 환산"  from employees
order by hire_date desc;

select * from member;

select *from employees;

--나머지 함수 : mod
select mod(27 , 2) , mod(27 , 5) , mod(27,7) from dual;

--employees 사번이 홀수인 사원을 출력하시오
select * from employees
where mod(employee_id,2) =1
order by employee_id asc;

--부서번호가 짝수인 사원을 출력하시오
select employee_id , emp_name , hire_date , salary , manager_id , department_id from employees
where mod(manager_id,2)=0
order by manager_id asc;

select bhit from board;

select avg(bhit) from board;


--평균 조회수를 2자리에서 반올림 출력
select  round(avg(bhit),2) from board;

--평균 조회수 소수점 버림
select  floor(avg(bhit)) from board;
--평균받아 높은 조회수를 가진 게시글 출력
select * from board
where bhit >= (select avg(bhit) from board);

-- to char : 형변환 시켜주는 구문
select to_char( salary,'999,999') , round(salary*1342.32) from employees;

--시퀀스
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

insert into board values(board_seq.nextval,'제목입니다.','내용입니다.',sysdate,'aaa',board_seq.currval,0,0,1,'1.jpg');
commit;

--dept_seq 시작은 10,증분 10

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


--1 . emp2의 사원번화와 employees 사원번호 똑같이 일치시킨다.
--2. emp2 의 관리자 번호와 employees 관리자 번호를 검색한다.
--3. employees 관리자 번호를 emp2 의 관리자 번호에 입력시킨다.
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

insert into emp01 values (emp_seq.nextval,'홍길동',sysdate);
insert into emp01 values (emp_seq.nextval,'유관순',sysdate);
insert into emp01 values (emp_seq.nextval,'이순신',sysdate);
insert into emp01 values (emp_seq.nextval,'홍길자',sysdate);


select * from emp01;


















select department_id,department_name from departments;

;
update stuscore a 
set rank = 1


where stunum = 1;
















