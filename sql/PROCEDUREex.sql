SET SERVEROUTPUT ON

+ PROCEDURE
    : 특정 작업을 수행하는, 이름이 있는 PL/SQL BLOCK
    : 매개변수를 받을 수 있고, 호출하여 반복적으로 사용할 수 있는 BLOCK
    
    [형식]
    CREATE OR REPLACE PROCEDURE [PROCEDURE NAME] (parameter IN 자료형, parameter IN 자료형, ...)
    IS
        변수 선언부
    BEGIN
        수행 로직
    END;
/