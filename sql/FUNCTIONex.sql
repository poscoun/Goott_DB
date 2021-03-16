 RETURN MSG;
END;
/

VARIABLE HI VARCHAR2(30);
EXECUTE :HI:=HELLO;
PRINT HI;

SELECT HELLO FROM DUAL;

--paramter
CREATE OR REPLACE FUNCTION TAX(P_VALUE IN NUMBER)
    RETURN NUMBER IS
        RESULT NUMBER;
    BEGIN
        RESULT := (P_VALUE*0.1);
    RETURN RESULT;
END;
/

SELECT TAX(800) FROM DUAL;

-- SAL_DESCRIBE : �����ȣ�� �Է��ϸ� �� ����� �޿������� ���
CREATE OR REPLACE FUNCTION SAL_DESCRIBE(VEMPNO IN NUMBER)
    RETURN NUMBER
    IS
      VSAL EMP.SAL%TYPE;
    BEGIN
        SELECT SAL INTO VSAL
        FROM EMP
        WHERE EMPNO = VEMPNO;
    RETURN VSAL;
END;
/

VAR SALARY NUMBER;
EXECUTE :SALARY := SAL_DESCRIBE(7900);
PRINT SALARY;

SELECT SAL_DESCRIBE(7900) FROM DUAL;

SELECT SAL_DESCRIBE(EMPNO) FROM EMP;

-- [�ǽ�] ��ü ����� �޿��� 10% �λ��� ����� ����غ����� (FUNCTION - SAL_UP)
CREATE OR REPLACE FUNCTION SAL_UP(VEMPNO IN NUMBER)
    RETURN NUMBER
    IS
        VSAL EMP.SAL%TYPE;
    BEGIN
        SELECT SAL*1.1 INTO VSAL
        FROM EMP
        WHERE EMPNO = VEMPNO;
    RETURN VSAL;
END;
/

SELECT SAL, SAL_UP(EMPNO) FROM EMP;


--------------------------------------------------------------------------------------------------
--CREATE TABLE CEMP
--AS
--SELECT * FROM EMP;
 
--�����ȣ�� �Է¹޾� �ش� ����� �޿� ���(10% �λ�� ���)
CREATE OR REPLACE FUNCTION CEMP_UP(VEMPNO IN NUMBER)
    RETURN NUMBER
    IS
        VSAL CEMP.SAL%TYPE;
    BEGIN
        UPDATE CEMP
        SET SAL = SAL*1.1
        WHERE EMPNO = VEMPNO;
        
        COMMIT;
        
        SELECT SAL INTO VSAL
        FROM CEMP
        WHERE EMPNO = VEMPNO;
    RETURN VSAL;
END;
/

VARIABLE SALARY NUMBER;
EXECUTE :SALARY := CEMP_UP(10000);
PRINT SALARY;

-- ����ڰ� ������ �Լ� ã��
DESC USER_PROCEDURES

SELECT OBJECT_NAME, OBJECT_TYPE
FROM USER_PROCEDURES
WHERE OBJECT_TYPE = 'FUNCTION';

-- �Լ� ���� 
--DROP FUNCTION [�Լ���]

-- �ǽ� : 10�� �μ��� �ٹ��ϰ� �ִ� ����� ���, �̸�, �޿��� ��ȸ�Ͻÿ�
--        : �Լ��� - EMP_SAL
-- 

CREATE OR REPLACE FUNCTION EMP_SAL(VEMPNO NUMBER)
    RETURN NUMBER
    IS
        VSAL NUMBER;
    BEGIN
        SELECT SAL INTO VSAL
        FROM EMP
        WHERE EMPNO = VEMPNO;
        RETURN VSAL;
END;
/

SELECT EMPNO, ENAME, EMP_SAL(EMPNO)
FROM EMP
WHERE DEPTNO = 10;

-- �ǽ� : ��ü ����� ���, �̸�, �μ����� ����Ͻÿ�
--        : �־��� �����ʹ� �μ���ȣ
--        : �Լ��� - getDname()

CREATE OR REPLACE FUNCTION getDname(VDNO EMP.DEPTNO%TYPE)
    RETURN VARCHAR2
    IS
        VDNAME VARCHAR2(30);
    BEGIN
        SELECT DNAME INTO VDNAME
        FROM DEPT
        WHERE DEPTNO = VDNO;
    RETURN VDNAME;
END;
/

SELECT EMPNO, ENAME, getDname(deptno) "DNAME"
FROM EMP;

-- ��ü ����� �����ȣ, ����̸�, �޿�, ����, ����, ����(10%)�� ��ȸ
CREATE OR REPLACE FUNCTION FULL_SAL
    (VSAL EMP.SAL%TYPE, VCOMM EMP.COMM%TYPE)
    RETURN NUMBER
    IS
    BEGIN
        RETURN (VSAL + NVL(VCOMM, 0));
    END;
/

SELECT EMPNO, ENAME, SAL, COMM, SAL+NVM(COMM, 0) "����", (SAL+NVM(COMM, 0))*0.1 "����(10%)"
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, FULL_SAL(SAL, COMM) "����", FULL_SAL(SAL, COMM)*0.1 "����(10%)"
FROM EMP;

-- �ǽ� : ��ü ����� �����ȣ, ����̸�, �޿�, ����, ����, ������ ��ȸ
--       (��, �޿� ���ؿ� ���� ������ �޸� ����)
--        : �޿��� 1000�̸��̸� 5% ���� 1000�̻� 2000�̸��̸� 10% ����, 2000�̻��̸� 20% ����
--        : ���� ������ ������ ����
--        : �Լ� �̸��� : DIF_TAX
