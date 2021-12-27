/*
# PL/SQL 이란
- 오라클에서 제공하는 SQL 프로그래밍 기능이다.
- 일반적으로 프로그래밍과 차이가 있지만, 
  오라클 내부에서 적절한 처리를 위해서 적용해 줄 수 있는 절차지향적 코드 작성 방식이다.
- 쿼리문의 집합으로 어떠한 동작을 일괄처리 하기 위한 용도로 사용한다.
*/

SET SERVEROUTPUT ON; -- 출력문 활성화

DECLARE -- 변수를 선언하는 구간(선언부)
    emp_num NUMBER;
BEGIN -- 대입/출력문/기타등등 코드를 실행하는 시작구간(실행부)
    emp_num := 10;
    dbms_output.put_line(emp_num); -- 출력문
    dbms_output.put_line('hello PL/SQL');
-- [EXCEPTION] 옵션
END; -- PL/SQL이 끝나는 구간(종료)

-- 연산자
-- 일반 SQL문의 모든 연산자의 사용이 가능하고
-- **는 제곱을 의미한다.
DECLARE
  A NUMBER := 2**2*3**2;
BEGIN
  DBMS_OUTPUT.PUT_LINE('a = ' || TO_CHAR(A));
END;


/*
- DML문
DDL문은 사용이 불가능하고, 일반적인 SQL문의 SELECT 등을 사용하는데,
특이한 점은 SELECT절 아래에 INTO절을 사용해 변수에 할당할 수 있다.
*/

DECLARE
    v_emp_name VARCHAR2(50); -- 사원명 변수 (문자열 변수는 길이제약이 필수 / 기본값이 없기 때문이다.) 
    v_dep_name VARCHAR2(50); -- 부서명 변수
BEGIN   
    SELECT
        e.first_name,
        d.department_name
    INTO
        v_emp_name, v_dep_name -- 변수에 대입을 의미
    FROM employees e 
    LEFT OUTER JOIN departments D
    ON e.department_id = d.department_id
    WHERE employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(v_emp_name || '-' || v_dep_name);
END;

-- 해당 테이블과 같은 타입의 컬럼을 선언하려면
-- 테이블명.컬럼명%TYPE을 사용함으로써 타입을 일일히 확인하는 번거로움을 방지할 수 있다.

DECLARE
    -- 컬럼 타입을 모르는 경우 변수선언할 때 해당 테이블을 확인할 필요가 없다.
    v_emp_name employees.first_name%TYPE; 
    v_dep_name departments.department_name%TYPE;    
BEGIN   
    SELECT
        e.first_name,
        d.department_name
    INTO
        v_emp_name, v_dep_name
    FROM employees e 
    LEFT OUTER JOIN departments D
    ON e.department_id = d.department_id
    WHERE employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(v_emp_name || '-' || v_dep_name);
END;