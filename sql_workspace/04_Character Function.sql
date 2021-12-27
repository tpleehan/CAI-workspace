-- lower(소문자), initcap(앞글자만 대문자), upper(대문자)
/*
dual이라는 테이블은 sys가 소유하는 오라클의 표준 테이블
오직 한 행에 한 컬럼만 담고 있는 dummy 테이블이다.
일시적인 산술 연산이나 날짜 연산 등을 위해 주로 사용된다.
모든 사용자가 dual을 사용할 수 있도록 되어 있다.
*/
SELECT 'abcDEF', LOWER('abcDEF'), UPPER('abcDEF')
FROM dual;

SELECT last_name, lower(last_name), initcap(last_name), upper(last_name)
FROM employees;

SELECT last_name
FROM employees
WHERE lower(last_name) = 'austin';

-- length(길이), instr(문자 찾기)
SELECT 'abcdef' AS ex, LENGTH('abcdef'), INSTR('abcdf', 'a')
FROM dual;

SELECT first_name, LENGTH(first_name), INSTR(first_name, 'a')
FROM employees;

-- substr(문자열 자르기), concat(문자 연결)
SELECT 'abcdef' AS ex, SUBSTR('abcdef', 1, 2), CONCAT('abc', 'def')
FROM dual;

SELECT first_name, SUBSTR(first_name, 1, 3), CONCAT(first_name, last_name)
FROM employees;

-- LPAD, RPAD (좌/우측 지정 문자열로 채우기)
SELECT LPAD('abc', 10, '*') FROM dual;
SELECT RPAD('abc', 10, '*') FROM dual;

-- LTRIM(), RTRIM(), TRIM() 공백제거
-- L/RTRIM 좌/우측에 지정한 문자 제거
SELECT LTRIM('javascript_java', 'java')
FROM dual;

SELECT RTRIM('javascript_java', 'java')
FROM dual;

SELECT TRIM('    java     ')
FROM dual;

-- REPLACE(문자열 치환)
SELECT REPLACE('my dream is a president', 'president', 'doctor')
FROM dual;

SELECT REPLACE('my dream is a president', ' ', '') -- 공백 제거
FROM dual;

SELECT REPLACE (REPLACE('my dream is a president', 'president', 'doctor'), ' ', '')
FROM dual;

SELECT REPLACE (CONCAT('hello ', 'world'), ' ', '')
FROM dual;

/*
연습문제 
1. EMPLOYEES 테이블에서 JOB_ID가 IT_PROG인 사원의 이름(first_name)과 급여(salary)를 출력
 조건1) 비교하기 위한 값은 소문자로 입력 (Hint: lower 이용)
 조건2) 이름은 앞 3문자까지 출력하고 나머지는 *로 출력
        이 열의 열 별칭은 name (Hint: rpad와 substr 또는 substr 그리고 length 사용)
 조건3) 급여는 전체 10자리로 출력하고 나머지 자리는 *로 출력
         이 열의 열 별칭은 salary (Hint: lpad 사용)
*/
SELECT 
    RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name), '*') AS name, 
    LPAD(salary, 10, '*') AS salary
FROM employees
WHERE lower(job_id) = 'it_prog';

/*
1. EMPLOYEES 테이블에서 이름, 입사일자 컬럼으로 변경해서 이름순으로 오름차순 출력
 조건1) 이름 컬럼은 first_name, last_name을 붙여서 출력
 조건2) 입사일자 컬럼은 xx/xx/xx로 저장되어 있으나, xxxxxx형태로 출력
*/
SELECT 
    --first_name || ' ' || last_name AS name, 
    CONCAT (first_name, last_name) AS 이름,
    REPLACE(hire_date,'/','') AS 입사일자
FROM employees
ORDER BY 이름 ASC;

/*
2. EMPLOYEES 테이블에서 phone_number컬럼은 ###.###.####형태로 저장되어 있다.
   처음 세 자리 숫자 대신 서울 지역번호(02)를 붙여 전화 번호를 출력하도록 쿼리 작성
*/
SELECT 
    CONCAT ('(02)', SUBSTR(phone_number, 4, LENGTH(phone_number))) AS phone_number,
    REPLACE(phone_number, SUBSTR(phone_number, 1, 3), '(02)') AS phone_number
FROM employees;
