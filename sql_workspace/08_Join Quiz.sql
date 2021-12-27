-- 문제1.
-- EMPLOYEES 테이블과 DEPARTMENTS 테이블은 DEPARTMENT_ID로 연결되어 있다.
-- EMPLOYEES, DEPARTMENTS 테이블 엘리어스를 이용해서
-- 각각 INNER, LEFT OUTER, RIGHT OUTER, FULL OUTER 조인 (달라지는 행의 개수 확인)
SELECT *
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id; -- 106개

SELECT *
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id; -- 107개

SELECT *
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id; -- 122개

SELECT *
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id; -- 123개

-- 문제2.
-- EMPLOYEES, DEPARTMENTS 테이블 INNER JOIN 쿼리문 작성
-- 조건) employee_id가 200인 사람의 이름, department_id를 출력한다.
-- 조건) 이름 컬럼은 first_name과 last_name을 합쳐서 출력한다.
SELECT
    e.first_name || ' ' || e.last_name AS name,
    CONCAT(e.first_name, e.last_name) AS name,
    d.department_id
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = 200;

-- 문제3.
-- EMPLOYEES, JOBS테이블을 INNER JOIN 쿼리문 작성
-- 조건) 모든 사원의 이름과 직무아이디, 직무 타이틀을 출력하고, 이름 기준으로 오름차순 정렬
-- HINT) 어떤 컬럼으로 서로 연결 되어 있는지 확인
SELECT 
    e.first_name, j.job_id, j.job_title
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id
ORDER BY e.first_name ASC;

-- 문제4.
-- JOBS테이블과 JOB_HISTORY테이블을 LEFT OUTER JOIN 쿼리문 작성
SELECT * 
FROM jobs LEFT OUTER JOIN job_history
ON jobs.job_id = job_history.job_id;

-- 문제5.
-- Steven King의 부서명을 출력
SELECT 
    e.first_name || ' ' || e.last_name AS name,
    CONCAT(e.first_name, e.last_name) AS name,
    d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
WHERE e.first_name = 'Steven'
AND e.last_name = 'King';

-- 문제6.
-- EMPLOYEES 테이블과 DEPARTMENTS 테이블을 Cartesian Product(Cross join) 처리
SELECT *
FROM employees CROSS JOIN departments;

-- 문제7.
-- EMPLOYEES 테이블과 DEPARTMENTS 테이블의 부서번호를 조인하고
-- SA_MAN 사원만의 사원번호, 이름, 급여, 부서명, 근무지를 출력 (Alias 사용)
SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    d.department_name,
    loc.city
FROM employees e 
LEFT OUTER JOIN departments d ON e.department_id = d.department_id
LEFT OUTER JOIN locations loc ON d.location_id = loc.location_id
WHERE e.job_id = 'SA_MAN';

SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    d.department_name,
    d.location_id,
    loc.city
FROM employees e 
JOIN departments d ON e.department_id = d.department_id
JOIN locations loc ON d.location_id = loc.location_id
WHERE e.job_id = 'SA_MAN';

-- 문제8.
-- employees, jobs 테이블을 조인 지정하고 job_title이 'Stock Manager', 'Stock Clerk'인 직원 정보만 출력
SELECT *
FROM employees e 
LEFT OUTER JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_title = 'Stock Manager'
OR j.job_title = 'Stock Clerk';


SELECT *
FROM employees e 
JOIN jobs j ON e.job_id = j.job_id
WHERE job_title IN ('Stock Manager', 'Stock Clerk');

-- 문제9.
-- departments 테이블에서 직원이 없는 부서를 찾아 출력. LEFT OUTER JOIN 사용
SELECT *
FROM departments d LEFT OUTER JOIN employees e
ON d.department_id = e.department_id
WHERE e.department_id IS NULL;

-- 문제10.
-- join을 이용해서 사원의 이름과 그 사원의 매니저 이름을 출력
-- Hint) EMPLOYEES 테이블과 EMPLOYEES 테이블을 조인 (SELF JOIN)
SELECT 
    e.first_name,
    e1.first_name
FROM employees e INNER JOIN employees e1
ON e.employee_id = e1.manager_id;

SELECT 
    e1.first_name,
    e2.first_name AS manager_name
FROM employees e1 LEFT OUTER JOIN employees e2
ON e1.manager_id = e2.employee_id;

-- 문제11.
-- 문제6번 EMPLOYEES 테이블에서 LEFT JOIN 하여 관리자(매니저)와 매니저의 이름, 매니저의 급여까지 출력
-- 매니저 아이디가 없는 사람은 배제하고 급여는 역순으로 출력
SELECT 
    e.first_name,
    e1.first_name,
    e1.salary
FROM employees e LEFT OUTER JOIN employees e1
ON e.manager_id = e1.employee_id
ORDER BY e1.salary DESC;

SELECT 
    e1.employee_id,
    e1.first_name,
    e1.manager_id,
    e2.first_name,
    e2.job_id,
    e2.salary
FROM employees e1 LEFT OUTER JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.manager_id IS NOT NULL
ORDER BY e1.salary DESC;