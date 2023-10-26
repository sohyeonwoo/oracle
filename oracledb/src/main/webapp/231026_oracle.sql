select employee_id from employees
where mod(employee_id,2)=1;

--board
select * from board;

desc board;

select sysdate from dual;
select * from board
order by bno desc;

INSERT INTO board VALUES (
board_seq.nextval,'이벤트 진행','내용입니다.',SYSDATE,'ddd',board_seq.currval,0,0,1,'3.jpg');

select * from board
order by bno desc;

commit;

select sysdate-1 어제,sysdate 오늘,sysdate+1 내일
from dual;

select bno,bdate,btitle from board
order by bdate desc;

--현재날짜 기준으로 5일 이전 게시글을 출력
--번호 , 제목 , 작성일만 출력
select bno, btitle,bdate from board
where bdate > sysdate-5
order by bdate desc;

--employees 현재날짜 기준 입사일에서 현재 날짜까지 기간을 출력하시오
--소수점은 절사
--사원번호 , 사원명 , 입사일 , 부서번호 출력
select employee_id, emp_name, hire_date,salary,department_id,
trunc(sysdate - hire_date)
from employees;

--다음에 오는 일요일의 날짜를 알고싶을때
select next_day(sysdate,'일요일') from dual;

--현재 입력한 날의 마지막 일을 출력
select last_day(sysdate) from dual;

--입력한 값의 마지막 날이 언제인지 출력
select last_day('20231101') from dual;
select last_day('20231201') from dual;

--add , months
select add_months(sysdate,-2) from dual;

select to_date('20210113','yyyymmdd') + 2000 from dual;

SELECT TO_DATE('20210113', 'YYYYMMDD') + 1000 FROM dual;

--현재 기준으로 1년동안 작성된 글을 출력하시오
select bno,btitle,bdate from board
where bdate > add_months(sysdate,-6)
order by bdate desc;

날짜중 달만 출력

--날짜 중 년도만 , 달만 , 일만 출력 : extract
select extract( year from bdate) from board;
select extract ( month from bdate) from board;
select extract ( day from bdate)from board;

--3월 ,5월 , 7월 입력한 게시글을 출력하시오

select bno,btitle,bdate from board 
 where extract (month from bdate) in (3,5,7)
 order by bdate asc;

select bno,btitle,bdate from board;
select bdate 데이터날짜, round(bdate,'mm') 일자반올림 , trunc(bdate,'mm') 일자버림 from board;

--to_date 는 형변환 함수 
select round(to_date('20231015'),'mm') from dual;

select bdate from board;

--to_char 날짜를 문자형변환
select to_char(bdate,'yyyy-mm-dd dy hh:mi:ss')from board
order by bdate desc;

select bno,btitle,bcontent, to_char(bdate,'yyyy"년"mm"월"dd"일"') bdate,bgroup,bstep,bindent,bfile
from board;

--employees 입사일을 2023 - 11 - 01 화요일

select hire_date, to_char(hire_date, 'yyyy-mm-dd' ) from employees
order by hire_date desc;

-- 문자형 변환함수 
-- 숫자를 -> 문자로 변환

select to_char(123456789) 문자형 from dual;
select to_char(1234567890,'999,999,999,999')from dual;

select salary, to_char( salary,'$999,999,999'), salary*1342 원화월급 from employees;

-- 12345 총 9자리까지 표시하는데, 빈공백은 0으로 채워줌
select to_char(12345,'000000000') from dual;

select trim(to_char(12345,'L999,999,999'))
from dual;

-- board table 에서 bdate 와 비교해서 20231023 숫자와  같은날 입력한 게시글을 출력하시오
select bdate,bcontent from board 
where to_char(bdate,'yyyymmdd') = '20231023'
order by bdate desc;

--20200101부터 현재까지 기간이 얼마나 지났는지 출력하시오.
select trunc(sysdate - to_date( '20200101' ,'yyyymmdd'))
from dual;

select trunc(sysdate-to_date('19931011','yyyymmdd'))
from dual;

--태어난 날 부터 지금까지 달로 계산
select trunc(months_between(sysdate,to_date('19931011','yyyymmdd')))
from dual;


--문자를 숫자로 형변환함수
select to_number('10,000','99,999') from dual;

--연봉 + 커미션 포함
-- 월급 *12  / 월급 * 12 * 커미션 : 연봉으로 해서 출력하시오
select * from employees;

select employee_id 사원번호 ,salary 월급 , salary*12 연봉 , salary*12+(salary*12*nvl(commission_pct,0)) 최종연봉  from employees
order by employee_id;

select manager_id from employees
where manager_id is null;

select manager_id from employees;
--null 값을 0으로 만드는 방법
select nvl(manager_id,0) from employees;

select nvl(to_char(manager_id),'ceo') from employees;

--게시글 조회수 총합을 출력하시오.
select to_char(sum(bhit),'999,999,999') from board;

--월급의 평균을 구하시오
select round(avg(salary),2) from employees;

--min 최소값, max 최대값 avg 평균 , count 개수 , sum 합계

--부서가 50인 사원들의 합계 평균을 출력하시오
select * from employees;

select department_id  from employees
where department_id >= 50
order by department_id asc;

--날짜 게시글 개수를 출력하시오
select bdate,count(*) from board
group by bdate
order by bdate asc;

SELECT TO_CHAR(bdate, 'YYYY-MM') month, COUNT(*) count
FROM board
GROUP BY TO_CHAR(bdate, 'YYYY-MM')
ORDER BY month ASC;

--년도만 출력
select extract(year from bdate) from board;
--월만 출력
select extract(month from bdate) from board;
--일만 출력
select extract(day from bdate) from board;

select extract(month from bdate),count(extract(month from bdate))
from board
group by  extract(month from bdate)
order by  extract(month from bdate);

select add_months(bdate,0)
from board;

select count(*) from employees; --107개
select count(manager_id) from employees; --106개 null값이 있는거는 차감.

select department_id count(*) from employees
group by department_id
order by department_id;

select bno,btitle,min(bhit) from board
group by bno,btitle,bcontent ;

--조회수가 가장 낮은 게시글 출력
select * from board
where bhit = (select min(bhit) from board) ;

--최대 조회수가 가장 높은 게시글을 출력
select * from board
where bhit = (select max (bhit) from board);

-- 문자함수
select emp_name from employees ;

--si,SI 가 포함된 이름을 모두 출력하시오.
select emp_name from employees 
where emp_name  like '%si%' or emp_name like '%SI%' or emp_name like '%Si%' or emp_name like '%sI%' ;

--da가 포함된 모든 이름을 출력하시오
select emp_name from employees
where emp_name like '%da%' or emp_name like '%Da%' or emp_name like '%dA%' or emp_name like '%DA%';

SELECT emp_name
FROM employees
WHERE emp_name LIKE 'si%' OR emp_name LIKE 'SI%' OR emp_name LIKE 'Si%' OR emp_name LIKE 'sI%';

--da가 포함된 모든 이름 : 소문자 변환함수
select emp_name
from employees
where lower (emp_name) like ('%da%') ;
--da가 포함된 모든 이름 : 대문자 변환함수
select emp_name
from employees
where upper (emp_name) like ('%DA%') ;

--employees에서 이름을 대문자로 출력하시오 / upper
select upper(emp_name) from employees;
--employees에서 이름을 소문자로 출력하시오 / lower
select lower(emp_name) from employees;
--자리수를 만들어서 지정한 문자를 채뤄서 출력
select lpad(12345,10,'0') from dual;

select to_char(12345,'L0,000,000,000') from dual;

-- ltrim  왼쪽 공백제거
-- rtrim  오른쪽 공백 제거
-- ttrim 모든 공백제거
select rtrim('   a d c') from dual;

select * from employees;

--이름에 SS 를 I 로 바꾸는 명령.
select job_id,replace(job_id,'SS','I') from employees;

select * from emp2;

update emp2
set job_id = 'CLERK'
where job_id = 'SH_CLERK' ;
--substr(이름,4,3) : 이름에서 4번째 글자부터 3개 가져와라 : 해당컬럼에서 4번째 글자부터 2개를 짤라와서 출력.
-- 4번째 부터 이름 3개를 가져옴

select job_id ,replace(job_id,'SH_CLEAK','CLERK') from emp2;


select emp_name,substr(emp_name,1,5) from employees;

select hire_date from employees;

select * from employees;

select substr(emp_name,1,5) || to_char(hire_date,'yyyy')  from employees;

select * from employees;

--입사일이 6월 사람중에 이름이 D가 들어가 있는 사원을 출력하시오

select hire_date month 6 , emp_name 'd' from employees;
--입사일이 6월 사람중에 이름이 D가 들어가 있는 사원을 출력하시오 챗gpt
SELECT hire_date , emp_name  
FROM employees
WHERE TO_CHAR(hire_date, 'MM') = '06' AND emp_name LIKE '%D%' ;



update board
set bhit = 1;

select bno,bhit,bhit+100 from board ;

--bhit 에 100씩 더해서 최신화 시키는 방법
update board a
set bhit  =(select bhit +100 from board b  where a.bno = b.bno);

select bhit from board;

select job_id from emp2;

update emp2 a 
set job_id = (select replace(job_id,'CLERK1','SH_CLERK')from emp2 b where
a.employee_id = b.employee_id);


commit;

desc emp2;

--게시글 날짜를 1씩 증가해서 update 를 하세요
update board a
set a.bdate  = (select bdate+1 from board b where a.bno = b.bno) ;

--게시글 날짜를 1씩 증가해서 update 를 하세요 챗gpt
UPDATE board a
SET a.bdate = (SELECT b.bdate + 1 FROM board b WHERE a.bno = b.bno);

select * from stuscore;
update stuscore
set rank=0;
select * from stuscore ;

select rank() over(order by total) from stuscore;

select b_num , b_num from
(select stunum b_num,rank() over (order by total desc) b_rank from stuscore);

SELECT b_num, b_rank
FROM (SELECT stunum  b_num, RANK() OVER (ORDER BY total DESC)  b_rank FROM stuscore);


update stuscore a
set rank = ( select b_rank from
(select stunum b_num, rank() over (order by total desc) b_rank from stuscore) b
where a.stunum = b_num;

--챗 gpt
UPDATE stuscore a
SET rank = (
  SELECT b_rank
  FROM (
    SELECT stunum  b_num, RANK() OVER (ORDER BY total DESC)  b_rank
    FROM stuscore
  ) b
  WHERE a.stunum = b.b_num 
);

select  avg(length(emp_name))  from employees;

select substr(emp_name,1,avg(length(emp_name))) from employees
group by emp_name; --오류

SELECT SUBSTR(emp_name, 1, avg(length(emp_name))) FROM employees; --오류

--employees 폰번호 5번째 3개와 이름 1,5번째까지 2개를 함께 출력하시오.

select * from employees;

--instr 찾고자 하는 위치 숫자출력
select instr(emp_name,'o') from
employees
where employee_id = 198;

select  substr(phone_number,5,3) 폰번호, substr(emp_name,1,5) 이름 from employees;

select substr(emp_name,instr(emp_name,' ')+1) from employees;

-- -를 기준으로 뒤에 7자리 가져오기 1101111
select substr('880101-1101111',instr('880101-1101111','-')+1) from dual;
--주민번호 앞에 자리 가져오기
select substr('880101-1101111',1,instr('880101-1101111','-')-1) from dual;

--employees 의 phone_number 첫번째 .점 기준으로 앞부분 뒷부분 출력

select phone_number, substr(phone_number, instr(phone_number,'.')+1) from employees ;

select instr('123.456.789','.') from dual; --점이 있는 위치값

select instr('123.456.789','.',1,3) from dual; --첫번째 숫자 1은 시작위치 , 두번째 숫자는 점의 두번째 위치값

select instr('123.456.789.000','.',-1,1) from dual; --첫번째 숫자 1은 시작위치 , 두번째 숫자는 점의 두번째 위치값

select * from member;
--전화번호 - 첫번째 값 출력 , 두번째 , 세번째 값을 출력하시오

select substr(phone,1, instr(phone, '-')-1) from member;

select substr(phone, instr(phone,'-')+1 , instr(phone,'-',1,2)) from member;

--폰번호에서 123 포함되어 있는 전화번호 출력
select phone_number from employees
where phone_number 
like '%123%';

select * from employees;

--부서별 최대 월급 출력하시오
select department_id,max(salary) 최대월급 , min(salary) 최소월급  from employees
group by department_id;

select  emp_name 이름 ,to_char(hire_date,'yyyy.mm.dd day') 입사일 from employees;
commit;





