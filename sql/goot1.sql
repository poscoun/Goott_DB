--ȸ������ ���̺� (ȸ�����Կ�)
--goott_member table
--
--id  pw  name birth mp email regdate memno(px)
--                            ��¥ : �ð��� ���Ӽ��� �ʿ��� �� 
--                            ���� : ������ �ð� ������ ���

create table goott_member
(memno NUMBER(10) constraint goott_member_memno_pk primary key,
id varchar2(20),
pw varchar2(20),
name VARCHAR2(20),
birth VARCHAR2(10),
mp VARCHAR2(15),
email VARCHAR2(50),
regdate date);

create SEQUENCE GOOTT_MEMBER_MEMNO_SEQ
start WITH 1
INCREMENT by 1
MINVALUE 1
NOCYCLE
NOCACHE;