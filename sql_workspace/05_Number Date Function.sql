-- 숫자 함수
-- ROUND (반올림)
-- 소수점 1번째 위치 반올림, 0 번째 위치 반올림, 좌측 1번째 위치 반올림
SELECT ROUND(3.1415, 1), ROUND(45.923, 0), ROUND(45.923, -1)
FROM dual;

-- TRUNC (절사)
-- 정해진 소수점 자리수까지 잘라낸다.
SELECT TRUNC(3.1415, 2), TRUNC(45.923, 0), TRUNC(45.923, -1)
FROM dual;

-- ABS (절대값)
SELECT ABS(-34) FROM dual;

-- CEIL (올림), FLOOR(내림)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

-- mod (나머지)
SELECT 10 / 2, mod(10, 2)
FROM dual;



-- 날짜 함수
SELECT sysdate FROM dual;
SELECT systimestamp FROM dual;

-- 날짜 연산이 가능하다.
SELECT first_name, sysdate - hire_date 
FROM employees;

SELECT first_name, hire_date,
(sysdate - hire_date) / 7 AS week
FROM employees; -- week

SELECT first_name, hire_date,
(sysdate - hire_date) / 365 AS year
FROM employees; -- year

-- 날짜 반올림, 절사
SELECT ROUND(sysdate) FROM dual;
SELECT ROUND(sysdate, 'year') FROM dual; -- 년 기준으로 반올림
SELECT ROUND(sysdate, 'month') FROM dual; -- 월 기준으로 반올림
SELECT ROUND(sysdate, 'day') FROM dual; -- 일 기준으로 반올림(해당 주의 일요일 날짜를 반환)

SELECT TRUNC(sysdate) FROM dual;
SELECT TRUNC(sysdate, 'year') FROM dual;
SELECT TRUNC(sysdate, 'month') FROM dual;
SELECT TRUNC(sysdate, 'day') FROM dual; -- 일 기준으로 절사 (해당 주의 일요일 전으로 돌아간다)