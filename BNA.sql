create sequence lodtbl_seq start with 1 increment by 1 minvalue 1 maxvalue 1000 nocycle;

create sequence acttbl_seq start with 1 increment by 1 minvalue 1 maxvalue 1000 nocycle;

create sequence lodrestbl_seq start with 1 increment by 1 minvalue 1 maxvalue 1000 nocycle;

create sequence actrestbl_seq start with 1 increment by 1 minvalue 1 maxvalue 1000 nocycle;

-- 숙소 테이블
create table lodtbl(
lodnum number primary key, 
lodname varchar2(50) not null, 
lodprice number not null, 
lodimg1 varchar2(50) not null, 
lodimg2 varchar2(50) not null, 
lodimg3 varchar2(50) not null,
lodimg4 varchar2(50) not null, 
lodimg5 varchar2(50) not null,
lodinfo varchar2(200) not null, 
lodinfodet varchar2(1500) not null, 
lodrule varchar2(500) not null, 
lodfac varchar2(200) not null, 
lodopt varchar2(1500) not null, 
lodlat number not null, 
lodlng number not null, 
lodaddr varchar2(200) not null
);

--체험 테이블

create table acttbl(
actnum number primary key, 
actname varchar2(50) not null, 
actprice number not null,
actimg1 varchar2(50) not null, 
actimg2 varchar2(50) not null, 
actimg3 varchar2(50) not null,
actimg4 varchar2(50) not null,
actimg5 varchar2(50) not null, 
actinfo varchar2(200) not null, 
actinfodet varchar2(1500) not null,
actlat number not null, 
actlng number not null, 
actaddr varchar2(200) not null
);

--숙소 예약 테이블
create table lodrestbl(
lodresnum number primary key, 
lodnum number references lodtbl(lodnum) not null, 
id varchar2(30), 
loddate varchar2(30) not null, 
lodchkin varchar2(30) not null, 
lodchkout varchar2(30) not null,
lodpeople number not null
);

--체험 예약 테이블
create table actrestbl(
actresnum number primary key, 
actnum number references acttbl(actnum) not null, 
id varchar2(30), 
actdate varchar2(30) not null, 
actchkin varchar2(30) not null, 
actchkout varchar2(30) not null, 
actpeople number not null
);

-- 숙소 후기 테이블
create table lodrevtbl(
lodrevnum number primary key, 
lodnum number references lodtbl(lodnum) not null, 
lodrevname varchar2(30) not null, 
lodrevcont varchar2(200) not null
);

-- 체험 후기 테이블
create table actrevtbl(
actrevnum number primary key, 
actnum number references acttbl(actnum) not null, 
actrevname varchar2(30) not null, 
actrevcont varchar2(200) not null
);

--회원가입 테이블
create table signtbl(
id varchar2(30) primary key,
name varchar2(20) not null, 
passwd1 varchar2(40) not null, 
passwd2 varchar2(40) not null, 
mail varchar2(40) not null, 
tele varchar2(30) not null, 
address varchar2(50) not null, 
age number not null
);

--공지사항 테이블

create sequence notice_seq start with 1 increment by 1 minvalue 1 maxvalue 1000 nocycle;

create table notice(
noticenum number primary key, 
title varchar2(100) not null, 
content varchar2(2000) not null, 
writer varchar2(10) not null,
noticedate date, 
readcount number not null
);

--이벤트 테이블

create sequence event_seq start with 1 increment by 1 minvalue 1 maxvalue 1000 nocycle;

create table event(
eventnum number primary key, 
title varchar2(100) not null, 
content varchar2(2000) not null, 
writer varchar2(10) not null,
eventdate date, 
readcount number not null
);
