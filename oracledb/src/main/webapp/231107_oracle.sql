select * from stuscore;
select * from member;

select * from mem;

select * from stuinfo;

select * from 
(select rownum rnum,a. * from 
(select * from board
order by bgroup) a
)
where rnum >=1 and rownum<= 20
;
select * from
(select ROW_NUMBER() OVER (order by bgroup) rnum,a. * from board a)
where rnum >=11 and rnum <=20
;

select * from stuinfo;

select * from board;