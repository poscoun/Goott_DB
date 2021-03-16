SET SERVEROUT ON

-- [LOOP]
DECLARE
    i integer := 0;
BEGIN
    -- basic loop
    LOOP                -- LOOP�� ������ ���� �� ����ؼ� �ݺ�
        i := i+1;
    EXIT WHEN i>9;
    
    DBMS_OUTPUT.PUT_LINE('3 * ' ||  i || ' = ' || 3*i);
    END LOOP;
END;
/

-- [FOR LOOP]
--    FOR ī���ͺ��� IN �ּҰ� .. �ִ밪 LOOP
--        ���� 1;
--        ����2;
--        .
--        .
--    END LOOP;

--BEGIN
--    FOR (����)���� IN ���Ѱ� .. ���Ѱ� LOOP
--        ó���� ����;
--    END LOOP;

BEGIN
    for  i in 2 .. 9 loop
        for j in 1 .. 9 loop
            dbms_output.put_line(i || ' * ' || j  || ' = ' || (i*j));
        end loop;
    end loop;
end;
/

-- basic loop, for loop �� ���� 1���� 100������ ���� ���غ�����
-- basic loop
DECLARE
    I NUMBER := 0;
    VSUM NUMBER := 0;
BEGIN
    LOOP
        I := I+1;
    EXIT WHEN I>100;
    VSUM := VSUM + I;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('1���� 100������ ���� ' || VSUM);
END;
/

-- for loop
DECLARE
 VSUM NUMBER;
BEGIN
 VSUM := 0;
 FOR I IN 1.. 100 
    LOOP
     VSUM:=VSUM+I;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1���� 100������ ���� ' || VSUM);
END;
/

BEGIN
    FOR I IN REVERSE 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/

-- [WHILE LOOP]
--WHILE ���� LOOP
--    �ʿ��� ����;
--END LOOP;

DECLARE
    I NUMBER := 0;
BEGIN
    WHILE I<9 LOOP
        I := I+1;
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/

-- WHILE LOOP�� ���� 1���� 100������ ���� ���غ�����
DECLARE
    VSUM NUMBER := 0;
    I NUMBER := 0;
BEGIN
    WHILE I<=100 LOOP
        VSUM := VSUM + I;
        I:= I + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1���� 100������ ���� ' || VSUM);
END;
/


    
    









