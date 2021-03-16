SET SERVEROUT ON

-- [LOOP]
DECLARE
    i integer := 0;
BEGIN
    -- basic loop
    LOOP                -- LOOP는 조건이 없을 시 계속해서 반복
        i := i+1;
    EXIT WHEN i>9;
    
    DBMS_OUTPUT.PUT_LINE('3 * ' ||  i || ' = ' || 3*i);
    END LOOP;
END;
/

-- [FOR LOOP]
--    FOR 카운터변수 IN 최소값 .. 최대값 LOOP
--        문장 1;
--        문장2;
--        .
--        .
--    END LOOP;

--BEGIN
--    FOR (지역)변수 IN 하한값 .. 상한값 LOOP
--        처리할 문장;
--    END LOOP;

BEGIN
    for  i in 2 .. 9 loop
        for j in 1 .. 9 loop
            dbms_output.put_line(i || ' * ' || j  || ' = ' || (i*j));
        end loop;
    end loop;
end;
/

-- basic loop, for loop 로 각각 1부터 100까지의 합을 구해보세요
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
    
    DBMS_OUTPUT.PUT_LINE('1부터 100까지의 합은 ' || VSUM);
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
    DBMS_OUTPUT.PUT_LINE('1부터 100까지의 합은 ' || VSUM);
END;
/

BEGIN
    FOR I IN REVERSE 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/

-- [WHILE LOOP]
--WHILE 조건 LOOP
--    필요한 로직;
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

-- WHILE LOOP를 통해 1부터 100까지의 합을 구해보세요
DECLARE
    VSUM NUMBER := 0;
    I NUMBER := 0;
BEGIN
    WHILE I<=100 LOOP
        VSUM := VSUM + I;
        I:= I + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 100까지의 합은 ' || VSUM);
END;
/


    
    









