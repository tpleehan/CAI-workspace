-- 형 변환함수 TO_CHAR, TO_NUMBER, TO_DATE

-- 날짜를 문자로 변환하는 TO_CHAR(값, 형식)
SELECT TO_CHAR(sysdate) FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:SS') FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD PM HH:MI:ss') FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD A.M. HH:MI:ss') FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:ss') FROM dual;

-- 사용하고 싶은 문자를 ""를 묶어서 전달
SELECT first_name, TO_CHAR(hire_Date, 'YYYY"년" MM"월" DD"일"')
FROM employees;

-- 숫자를 문자로 변환하는 TO_CHAR(값, 형식)
SELECT TO_CHAR(20000, '99999') FROM dual;
-- 주어진 자릿수에 숫자를 모두 표기할 수 없으면 모두 #으로 표기된다. (5자리 숫자인데 4개로 지정)
SELECT TO_CHAR(20000, '9999') FROM dual;
SELECT TO_CHAR(20000.21, '99999.9') FROM dual;
SELECT TO_CHAR(20000.21, '99999.99') FROM dual; -- 소수점 자리수 지정
SELECT TO_CHAR(20000.21, '99999') FROM dual;
SELECT TO_CHAR(20000, '99,999') FROM dual;

SELECT TO_CHAR(salary, '$999,999') AS salary
FROM employees;

SELECT TO_CHAR(salary, 'L999,999') AS salary -- L을 사용하면 해당 지역의 원화를 표시해준다.
FROM employees;

SELECT TO_CHAR(salary, 'L099,999') AS salary
FROM employees;


-- 문자를 숫자로 변환하는 TO_NUMBER(값, 형식)
SELECT '2000' + 2000 FROM dual; -- 자동 형변환
SELECT TO_NUMBER('2000') + 2000 FROM dual; -- 명시적 형 변환
SELECT '$3,300' + 2000 FROM dual; --  에러 (특수기호 $ , 문자열로 되어 있기 때문에 invalid number 에러 표시)
SELECT TO_NUMBER('$3,300', '$9,999') + 2000 FROM dual;


-- 문자를 날짜로 변환하는 TO_DATE(값, 형식)
SELECT TO_DATE('2021-11-25') FROM dual; -- 기폰 패턴
SELECT sysdate - '2021-03-25' FROM dual; -- 에러 (날짜 형태로 표기 되어 있지만 문자열로 인식하기 때문에 invalid number 에러표시)
SELECT sysdate - TO_DATE('2021-03-25') FROM dual; -- TO_DATE를 통해 날짜로 변환해야 연산이 가능
SELECT TO_DATE('2020/12/25', 'YY/MM/DD') FROM dual;
-- 주어진 문자열은 모두 변환해야 한다.
SELECT TO_DATE('2021-03-31 12:23:50', 'YYYY-MM-DD HH:MI:SS') FROM dual; -- SQL Developer에 실행결과가 제대로 나타나지 않지만 해당 결과값은 정상

-- xxxx년 xx월 xx일 문자열 형식으로 변환
-- 조회 컬럼명은 dateInfo로 지정
SELECT '20050102' FROM dual;
SELECT 
    TO_CHAR(
        TO_DATE('20050102', 'YYYY/MM/DD'), 
        'YYYY"월" MM"월" DD"일"'
    ) AS dateInfo 
FROM dual;


-- NULL 제거 함수 NVL(컬럼, 변환할 타겟값)
SELECT null FROM dual;
SELECT NVL(null, 0) FROM dual;

SELECT * FROM employees;
SELECT
    first_name, 
    NVL(commission_pct, 0) AS comm_pct 
FROM employees;

-- NULL 제거 함수 NVL2(컬럼, null이 아닐 경우 값, null일 경우 값)
SELECT NVL2(null, '널아님', '널') FROM dual; 
SELECT NVL2(50, '널아님', '널') FROM dual; 

SELECT first_name, NVL2(commission_pct, 'true', 'false') AS comm_pct
FROM employees;

SELECT 
    first_name, 
    commission_pct,
    NVL2(commission_pct, salary + (salary * commission_pct), salary) AS real_salary
FROM employees;

SELECT 
    first_name, 
    salary + (salary * commission_pct) AS "real salary"
FROM employees;


-- DECODE(컬럼 혹은 표현식, 항목1, 결과1, 항목2, 결과2 ..... default)
SELECT 
    DECODE('B', 'A', 'A입니다.', 'B', 'B입니다.', 'C', 'C입니다.', '결과를 찾지 못했습니다.')
FROM dual; 

SELECT
    DECODE('Z', 'A', 'A입니다.', 'B', 'B입니다.', 'C', 'C입니다.', '결과를 찾지 못했습니다.')
FROM dual; 

SELECT
    job_id,
    salary,
    DECODE(job_id, 'IT_PROG', salary * 1.1, 'FI_MGR', salary * 1.2, 'AD_VP', salary * 1.3, salary)
    AS result
FROM employees;


-- CASE WHEN THEN ~ ELSE END
SELECT
    first_name,
    job_id,
    salary,
    (CASE job_id
        WHEN 'IT_PROG' THEN salary * 1.1
        WHEN 'FI_MGR' THEN salary * 1.2
        WHEN 'FI_ACCOUNT' THEN salary * 1.3
        WHEN 'AD_VP' THEN salary * 1.4
        ELSE salary
    END) AS result
FROM employees;

/*
문제1.
현재일자를 기준으로 EMPLOYEES테이블의 입사일자(hire_date)를 참고해서 근속년수가 15년 이상인 사원을 출력하도록 쿼리를 작성
조건1) 근속년수가 높은 사원 순서대로 결과가 나오도록 작성
*/
SELECT 
    employee_id AS 사원번호,
    CONCAT(first_name, last_name) AS 사원명,
    hire_date AS 입사일자,
    TRUNC((sysdate - hire_date) / 365) AS 근속년수
FROM employees
WHERE (sysdate - hire_date) / 365 >= 15
ORDER BY 근속년수 DESC;

/*
문제2.
EMPLOYEES 테이블의 manager_id 컬럼을 확인하여 first_name, manager_id, 직급을 출력
100이라면 '사원'
120이라면 '주임'
121이라면 '대리'
122이라면 '과장'
나머지는 '임원'으로 출력한다.
조건1) department_id가 50인 사람들을 대상으로만 조회
*/
SELECT 
    first_name,
    manager_id,
    (CASE manager_id
        WHEN 100 THEN '사원'
        WHEN 120 THEN '주임'
        WHEN 121 THEN '대리'
        WHEN 122 THEN '과장'
        ELSE '임원'
    END) AS 직원
FROM employees
WHERE department_id = 50;

SELECT 
    first_name,
    manager_id,
    DECODE(manager_id, 100, '사원',
           120, '주임', 121, '대리',
           122, '과장', '임원') AS 직원
FROM employees
WHERE department_id = 50;