select sysdate from dual;
select sysdate,sysdate +1,add_months(sysdate,1) from dual;
--이번달에 가장 마지막날 ( ) 특정날자 지정할수 있음
select last_day(sysdate) from dual;
--1월달에 가장 마지막 날짜 알려주기
select last_day('2022-01-01') from dual;

해당 연도 출력하기
select extract(year from sysdate ) from dual;
select extract(month from sysdate) from dual;
select extract(day from sysdate)from dual;

--날짜에서 날짜를 빼면 기간을 알 수 있음.
select bdate,trunc(sysdate - bdate)||'일' from board;

--지난 개월수를 출력
select bdate, trunc(months_between(sysdate,bdate))||'개월' from board;

--날짜 포맷 변경 : (날짜를 문자로 형변환)
select sysdate from dual;
select to_char(sysdate,'yyyy-mm-dd am hh:mi:ss') from dual;
select to_char ( sysdate,'yyyy"년"mm"월"dd"일"day')from dual;
--숫자에서 문자로 형변환 / 한화표시 / 달러표시
select 1234500000 from dual;
--원화로 표시방법 / L은 국가별 통화 표시로 나타냄  
select to_char(1234500000,'L999,999,999,999') from dual;
--9는 자리수 표시 / 빈공백은 0으로 자리수 표시
select to_char(1234500000,'000,999,999,999') from dual;
-- 빈공백을 없애는 것 ! trim
select trim(to_char(1234500000,'999,999,999,999'))from dual;
-- 달러표시
select to_char(1234500000,'$999,999,999,999')from dual;

select '2023-10-27' from dual;
-- 지정날짜에서 1달 추가하기
select sysdate,add_months('2023.10.27',1) from dual;
--얼만큼 지났는지 날짜 차일계산.
select sysdate - to_date('2023-10-01','yyyy-mm-dd') from dual;

select manager_id from employees; --10번에 null

-- 숫자 -> 문자형 변환 'ceo' 글자 출력 : null값에 ceo 출력
select nvl(to_char(manager_id),'ceo') from employees;

--월급 총금액
select to_char(sum(salary),'$999,999,999,999') from employees;
--원화 표시

select to_char(sum(salary*1342.32),'L999,999,999,999') from employees;

select max(salary),min(salary) from employees;
select department_id from employees;

select emp_name,max(salary) from employees
where department_id = 50
group by emp_name ;

select emp_name , salary from employees
where salary = (select max(salary) from employees);

select department_id , max(salary)평균최대 ,min(salary)평균최소 from employees
group by department_id ; 

select emp_name , max(salary) from employees
group by emp_name;


select emp_name , salary from employees;


--count(*) 
select count(*) from employees; --null값도 포함해서 107개
select count(manager_id) from employees; --null값을 포함하지 않아서 106개

select id from board;

select emp_name from employees;

select emp_name from employees
where emp_name like ('%D%') or emp_name like ('%d%');

--빈 공백을 0 으로 채우기
select to_char(12,'000.000') from dual;
select lpad(12,6,'0')from dual;

select id from board;

select substr(id,3,3) from board;
select bdate from board;
select to_char(bdate,'yyyymmdd')from board;
select substr(to_char(bdate,'yyyymmdd'),5,2) from board;

select id,instr(id,'ff')ff자리수 from board
where instr(id,'ff')!=0;

select id,length(id) from board;

--hire_date employees
--sustr 월을 출력하시오

select hire_date from employees;
select hire_date,substr(hire_date,4,2) from employees;

--이름에서 3부터 3개와 월을 함께 출력하시오
select hire_date,emp_name ,substr(hire_date,4,2),substr(emp_name,3,3) from employees;
select hire_date,emp_name, substr(emp_name,3,3)|| substr(hire_date,4,2) from employees;

-- 마지막 날짜 확인 last_day
--입사일에 마지막날짜를 출력하시오
select hire_date,last_day(hire_date) from employees;

select * from emp01;
create table fboard as select * from board;

select bhit from board;

update board
set bhit = bhit - 100;
commit;
rollback;

update board
set bhit = bhit + 1
where bno = 31 ;

select bhit from board;

update fboard
set bhit = 1;

select bhit from fboard;
commit;

select fboard.bno , fboard.bhit , bno , bhit from fboard a , board b;

update fboard a
set bhit = (select bhit from board b where a.bno=b.bno);

rollback;

desc fboard;

alter table fboard
add userid varchar2(30) ;

select userid from fboard;
--id 1번째 부터 3개 substr , bdate 월을 합친 값을  userid 에 입력하시오.

select substr(id,1,3) ||substr(bdate,4,2) from fboard;

update fboard a
set userid = (select substr(id,1,3) ||substr(bdate,4,2) 
from fboard b where a.bno = b.bno) ;

select * from fboard;

desc fboard;

--테이블 컬럼명을 변경
alter table fboard
rename column userid to uuid;

alter table fboard
modify uuid varchar(40);

--테이블 컬럼 추가 
alter table fboard
add u_id varchar2(30);

--컬럼 삭제
alter table fboard
drop column uuid;

--테이블 삭제
--drop table emp01;
--drop table emp2;

create table emp2 as select * from employees;

--테이블명 변경
--rename emp2 to emp02;

desc member;
rollback;
create table mem( 
id varchar2(30) primary key, --not null
pw varchar2(30) not null,
name varchar2(30) not null,
phone varchar2(13),
gender varchar2(1) check(gender in('m','f','M','F')),
hobby varchar2(80),
mlevel number(2) check(mlevel between 1 and 10),
mdate date default sysdate);

desc mem;
drop table mem;
insert into mem values (
'aaa','1111','홍길동','010-1111-1111','m','game',1,sysdate ) ; 


insert into mem(id,pw,name,gender) values (
'ccc','1111','유관순','f' ) ; 

insert into mem(id,pw,name) values (
'bbb','1111','유관순' ) ; 

alter table mem
modify phone varchar2(13);
select * from mem;
commit;

select * from member;
desc member

--오라클 switch , if 와 같은 조건문
--decode 같은 값인 경우만 비교 가능함
select * from employees;
select department_id from employees;
select department_id, department_name from departments;

--10총무기획부 20마케팅 30구매 40인사부 50배송부
select department_id from employees;
select department_id, 
decode(department_id,10,'총무기획부',20,'마케팅',30,'구매/생산부',40,'인사부',50,'배송부')
from employees;

select a.department_id , a.department_name 
from departments a , employees b
where a.department_id = b.department_id ;

--학생성적 테이블
create table sscore(
sno number(4) primary key,
sid varchar2(20),
total number(3) default 0 );

insert into sscore values(
sscore_seq.nextval,'a1',50 );

insert into sscore values(
sscore_seq.nextval,'a2',90 );

insert into sscore values(
sscore_seq.nextval,'a3',80 );
insert into sscore values(
sscore_seq.nextval,'a4',10 );
insert into sscore values(
sscore_seq.nextval,'a5',100 );
insert into sscore values(
sscore_seq.nextval,'a6',70 );
insert into sscore values(
sscore_seq.nextval,'a7',60 );
insert into sscore values(
sscore_seq.nextval,'a8',30 );
insert into sscore values(
sscore_seq.nextval,'a9',20 );
insert into sscore values(
sscore_seq.nextval,'a10',80 );
rollback;
select * from sscore;
commit;

select sno,sid,total,decode(total,10,'F',20,'F',30,'F',40,'F',50,'F',60,'F',70,'D',80,'B',90,'A',100,'A')
as hak from sscore;

select avg from stuscore;

select avg, 
case 
when avg >=90 then 'A'
when avg >=80 then 'B'
when avg >=70 then 'C'
when avg >=60 then 'D'
when avg < 60 then 'F'
end as hak
from stuscore;

select salary,
case 
when salary <=3000 then 'E'
when salary <=4000 then 'D'
when salary <=5000 then 'D'
when salary <=6000 then 'C'
when salary <=7000 then 'C'
when salary <=8000 then 'C'
when salary <=9000 then 'B'
when salary <=9999 then 'B'
when salary >=10000 then 'A'
end salary
from employees;

alter table emp02
add rank varchar2(10);

update emp02 a
set rank = (
select
case
when salary>=10000 then 'A'
when salary>=8001 then 'B'
when salary>=5001 then 'C'
when salary>=3000 then 'D'
when salary<3000 then 'F'
end rank2
from emp02 b where a.employee_id =  b.employee_id
);

select salary , rank from emp02;
--사원중에 평균월급 이하로 받는 사원을 출력하시오.
select emp_name,salary from employees
where salary <=(select avg(salary) from employees);
select avg(salary) from employees;

select bhit,bhit+100 from fboard ;

update fboard
set bhit = bhit + 100;
commit;
select bhit from fboard;

select bhit from board;

select a.bhit , b.bhit from fboard a , board b
where a.bno = b.bno;

rollback;

drop  table fboard;

create table fboard as select * from board;

select bhit from fboard;
select bhit from board;

--수정코드
update fboard a 
set bhit = (
select bhit from board b where a.bno = b.bno
);
------------------------------------------------------------
select bhit from fboard;
select bhit from board;

desc member;

ctreate table nboard(
bno number(4) primary key,
id varchar2(20),
btitle varchar2(1000) not null,
bcontent varchar2(4000),
bdate date,
constraint fk_nboard foreign key(id) references member(id)
--외래키 등록 이름 fk_nboard
);

CREATE TABLE nboard (
    bno NUMBER(4) PRIMARY KEY,
    id VARCHAR2(20),
    btitle VARCHAR2(1000) NOT NULL,
    bcontent VARCHAR2(4000),
    bdate DATE,
    CONSTRAINT fk_nboard FOREIGN KEY (id) REFERENCES member(id)
    -- 외래키 등록 이름 fk_nboard
);

select * from nboard;

insert into nboard values(
nboard_seq.nextval,'bbb','제목9','내용9',sysdate );
commit;

select * from member;
select * from nboard;

select * from member;
select * from nboard;

delete member 
where id = 'ddd';

-- 외래키로 등록 , primary key 테이블의 데이터가 삭제되면 외래키에 있는 데이터도 모두 삭제처리
alter table nboard
add constraint fk_nboard foreign key(id) references member(id)
on delete cascade ;
--primary key 데이블의 데이터가 삭제되면 외래키에 있는 데이터의 id만 null값으로 변경

alter table nboard
add constraint fk_nboard_id foreign key(id) references member(id)
on delete set null;

alter table nboard
drop constraint fk_nboard;

delete member
where id = 'aaa';

select * from nboard;



select * from board
order by bno;

select department_id, count(*) from employees where commission_pct is not null group by department_id;
select department_id, count(commission_pct) from employees group by department_id;

--그룹함수에서 그룹함수의 값의 조건을 처리하려면 having 명령어를 사용

select department_id, count(commission_pct)
from employees
group by department_id 
having count (commission_pct) !=0;

--부서별로 평균 이상의 월급만 출력하시오

select * from employees;

--부서별 평균을 출력
select department_id ,avg(salary) from employees
group by department_id;

--전체 평균 구하기
select avg(salary) from employees;


--전체 평균을 보다 높은 dapartment_id 구하기.
select department_id ,avg(salary) from employees
group by department_id
having avg(salary) > (select avg(salary) from employees);
--------
select a.department_id,b.department_name,avg(salary) as aaa
from employees a, departments b
where a.department_id = b.department_id
group by a.department_id,b.department_name
having avg(salary)>(select avg(salary) from employees )
;





















































