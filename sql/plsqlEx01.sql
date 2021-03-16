--SQL + (프로그래밍)언어적 성격 ==> PL/SQL              CF) 오라클 DB에서만 적용
--
--+ 종류
--
--1. Anonymous Block
--2. Procedure
--3. Function
--4. Package
--5. Trigger

1. Anonymous Block 기본 형태 (4가지 요소)
1) DECLARE               (선택)
            변수 선언부 : 변수를 선언
2) BEGIN                    (필수)
               실행부     : 로직을 처리
3) EXCEPTION           (선택)
            예외처리부 : 예외사항을 처리
4) END                        (필수)
            종료표시부