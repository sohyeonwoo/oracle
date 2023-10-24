select * from departments;

select * from departments order by manager_id asc;

select * from employees;

select * from employees order by employee_id asc; --순차정렬

select * from employees order by employee_id desc; --역순정렬

select * from employees where employee_id >=200;

select * from employees
where employee_id >=190 and employee_id <=205;

select * from employees
where salary >=5000 order by salary asc;

--사번,이름,직급,부서 출력

select employee_id,emp_name,job_id,department_id,salary from employees;

--테이블의 데티어 복사
create table emp2 as select * from employees;

select * from emp2;

desc emp2;

--컬럼이름 변경
alter table emp2 rename column emp_name to e_name;

alter table emp2 modify email number(50);
--컬럼삭제
alter table emp2 drop column create_date;
--칼럼 추가
alter table emp2 add create_date date;

--컬럼순서변경
alter table emp2 modify update_date invisible;
alter table emp2 modify update_date visible;
select * from emp2;

--컴럼의 데이터만 복사
insert into emp2 select * from employees;

select * from emp2;

select emp_name,salary,hire_date from emp2 order by emp_name asc;

alter table emp2 modify salary invisible;


alter table emp2 modify job_id visible;

desc emp2;

--별칭 선언 as 다음 붙이는거
select salary,salary*12 as y_salary, salary*12*1342 as ky_salary from employees;

select * from employees;

--연봉
select aslary , salary*12 from employees;

select salary , 
salary *12 as "연봉",
(salary*12)*nvl(commission_pct,0) as "인센티브",
(salary*12)+(salary*12)*nvl(commission_pct,0) as"실제연봉" from employees;

--null값을 0으로 표기하는 방법 nvl함수를 적는다.
select nvl(manager_id,0) from employees;

--사번 , 월급 , 직급 , 커미션 , 연봉 , 연봉+커미션 을 출력하시오.

select employee_id , salary ,salary*12 y_salary, (salary*12)+(salary*12)*nvl(commission_pct,0) c_salary from employees;

--월급이 6000인 사원 검색
select * from employees where salary=6000;

--커미션이 null(없는) 사람만 출력하시오
select * from employees where commission_pct = null; --검색안됨 : 등가비교 안됨
select*from employees where commission_pct is null; --검색가능 is 붙여야함 //커미션이 없는사람
select*from employees where commission_pct is not null; --커미션이 있는 사람만 검색

select commission_pct from employees;

--부서번호 , 부서명을 변경하고 부서번호가 10보다 크고 40보다 작게 출력
select   department_id "부서번호" ,  department_name "부서명"  from departments 
where department_id >= 10 and department_id <= 40;

select emp_name||'is a'||salary from employees;
select concat(concat(emp_name,'is a'),job_id) con_name from employees;

select * from stuscore;

select avg from stuscore;



select distinct department_id from employees
order by department_id asc;

--job_id 중복제거 출력하시오.
select distinct job_id from employees
order by job_id asc;

--월급이 3000,5000,6000인 사람을 출력하시오

select * from employees
where salary = 3000 or salary = 5000 or salary = 6000
order by salary desc;

SELECT salary, salary+1000,(salary+1000)*1342 "원화" 
from employees
where salary <=5000
order by salary desc;

--부서번호가 10번 30번 50번 인 사원의 사원번호, 사원이름 , 부서번호 , 직급 ,월급,입사일을 출력하시오
select * from employees;

select employee_id, emp_name, department_id, job_id, salary, hire_date
from employees
where DEPARTMENT_ID=10 or DEPARTMENT_ID=30 or DEPARTMENT_ID = 50
order by department_id desc;

select * from employees order by employee_id;

select * from employees;

--월급이 4천달러 이상 8천달러 미만인 사람들 사원번호로 내림차순
select employee_id, emp_name, department_id, job_id, salary, hire_date 
from employees
where salary >=4000 and salary <=8000 and
hire_date > '03/09/01'
order by employee_id desc;
commit;




