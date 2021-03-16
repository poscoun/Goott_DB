SET SERVEROUT ON

--[제어문]
--[IF문]
--
-- - 처리 조건 한개 일 경우
--IF 조건 THEN
--    문장..;
--END IF;
--
-- - 처리 조건이 두개 일 경우
-- IF 조건 THEN
--    문장...;
-- ELSE
--    문장...;
-- END IF;
-- 
-- - 처리 조건이 여러개 일 경우
-- IF 조건1 THEN
--    문장...;
-- ELSIF 조건2 THEN
--    문장...;
--...
-- ELSE
--   문장...;
-- END IF;

ACCEPT VNO PROMPT'당신의 성적을 입력하세요 :'
DECLARE
    VSCORE NUMBER:=&VNO;
BEGIN
    IF VSCORE>=90 THEN
        DBMS_OUTPUT.PUT_LINE('A학점');
    ELSIF VSCORE>=80 THEN
        DBMS_OUTPUT.PUT_LINE('B학점');
    ELSIF VSCORE>=70 THEN
        DBMS_OUTPUT.PUT_LINE('C학점');
    ELSIF VSCORE>=60 THEN
        DBMS_OUTPUT.PUT_LINE('D학점');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F학점');
    END IF;
END;
/
--[CASE 문]
--A 학점이면 : 참 잘했어요
--B 학점이면 : 잘했어요
--C 학점이면 : 준수하다
--D : 고생했어요
--F : 내년에봐요

ACCEPT VGRADE PROMPT'당신의 학점을 입력하세요'
DECLARE
    --GRADE CHAR(1);
    GRADE CHAR(2):=&VGRADE;
BEGIN
   -- GRADE:='B';
    CASE GRADE
    WHEN 'A' THEN 
    DBMS_OUTPUT.PUT_LINE('참 잘했어요');
     WHEN 'B' THEN 
    DBMS_OUTPUT.PUT_LINE('잘했어요');
     WHEN 'C' THEN 
    DBMS_OUTPUT.PUT_LINE('준수하다');
     WHEN 'D' THEN 
    DBMS_OUTPUT.PUT_LINE('고생했어요');
     ELSE
    DBMS_OUTPUT.PUT_LINE('내년에봐요');
END CASE;
END;
/
-----------------------------------------------------------------
--사원번호가 7900인 사원의 급여정보가 궁금
--이 사원의 급여가 3000이상이면 급여를 출력
--급여가 300이하이면 급여를 미공개-****

SELECT * FROM EMP
WHERE EMPNO = 7900;

SELECT EMPNO
FROM EMP
WHERE SAL >=3000;

DECLARE
    VEMPNO NUMBER(4):=7900;
    VENAME VARCHAR2(20);
    VSAL NUMBER(4);
BEGIN
    SELECT ENAME,SAL INTO VENAME,VSAL
    FROM EMP
    WHERE EMPNO = VEMPNO;
    DBMS_OUTPUT.PUT_LINE('사번  '||'     '||'이름  '||'    '||'급여 ');
    IF VSAL>=3000 THEN    
    DBMS_OUTPUT.PUT_LINE(VEMPNO||'     '||VENAME||'    '|| VSAL);
    ELSE
    DBMS_OUTPUT.PUT_LINE(VEMPNO||'     '||VENAME||'    '|| '****');
    END IF;
END;
/

ACCEPT VNO PROMPT'검색할 사번 입력'
DECLARE
    --VEMPNO NUMBER(4):=&VNO;
--    VEMPNO NUMBER(5):=&VNO;
--    VENAME VARCHAR2(20);
--    VSAL NUMBER(7);

--    VEMPNO EMP.EMPNO%TYPE:=&VNO;
--    VENAME EMP.ENAME%TYPE;
--    VSAL EMP.SAL%TYPE;

    VEMPNO EMP.EMPNO%TYPE:=&VNO;
    VEMP EMP%ROWTYPE;
BEGIN
 -- SELECT EMPNO,ENAME,SAL INTO VEMPNO, VENAME, VSAL
 SELECT * INTO VEMP
 FROM EMP
 WHERE EMPNO = VEMPNO;

 DBMS_OUTPUT.PUT_LINE('==============');
 --DBMS_OUTPUT.PUT_LINE(VEMPNO||'   '||VENAME||'   '||VSAL);
 DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||'   '||VEMP.ENAME||'   '||VEMP.SAL||'    '||VEMP.TEL);
END;
/
--현재 회사가 잘 성장해서 드디어 사원번호가 10000번이 생김
ALTER TABLE EMP
MODIFY EMPNO NUMBER(5);

INSERT INTO EMP(EMPNO,ENAME, SAL, DEPTNO)
VALUES(10000,'GOOTT',500,10);

--회사 정보에 수정이 생김(TEL추가)
ALTER TABLE EMP
ADD TEL VARCHAR2(16);

INSERT INTO EMP(EMPNO,ENAME,SAL,DEPTNO,TEL)
VALUES(10001,'GOOTT2',600,20,'01011112222');

    












