SELECT * FROM employees;

-- WHERE 비교 (데이터 값은 대/소문자를 구분한다.)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG';

SELECT * FROM employees
WHERE last_name = 'King';

SELECT * FROM employees
WHERE department_id = '90';

SELECT * FROM employees
WHERE salary >= 15000;

SELECT * FROM employees
WHERE hire_date = '04/01/30';

-- 데이터 행 제한 (BETWEEN, IN, LIKE)

-- BETWEEN (특정 값을 범위 조건을 확인할 때 사용)
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;
/*
위와 같이 동일
SELECT * FROM employees
WHERE SALARY >= 15000 AND salary <= 20000;
*/
SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN (특정 값들과 비교할 때 사용)
SELECT * FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');

-- LIKE ( %(퍼센트)는 모든,  _(언더바)는 데이터의 위치를 찾을 때 사용)
SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '03%';

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%15';

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%';

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%';

-- IS NULL (null 값을 찾을 때 사용)
SELECT * FROM employees
WHERE manager_id IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

-- AND, OR
-- AND가 OR보다 연산 순위가 빠르다.
SELECT * FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR' 
AND salary >= 6000;

-- 소괄호로 우선순위를 먼저 줄 수 있다.
SELECT * FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;

-- 데이터의 정렬 ORDER BY (SELECT 구문의 가장 마지막에 배치)
-- ASC: ascending 오름차순
-- DESC: descending 내림차순
SELECT * FROM employees
ORDER BY hire_date ASC;

SELECT * FROM employees
ORDER BY hire_date DESC;

SELECT * FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY first_name ASC;

SELECT * FROM employees
WHERE salary >= 5000
ORDER BY employee_id DESC;

SELECT first_name, salary*12 as pay
FROM employees
ORDER BY pay ASC;