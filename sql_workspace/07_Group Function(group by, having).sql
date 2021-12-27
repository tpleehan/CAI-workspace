-- 그룹 함수 AVG, MAX, MIN, SUM, COUNT
SELECT 
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(*)
FROM employees;

SELECT COUNT(*) FROM employees; -- 총 행 데이터의 수
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees; -- null이 아닌 행의 수
SELECT COUNT(manager_id) FROM employees; -- null이 아닌 행의 수

-- 부서별로 그룹화, 그룹함수의 사용
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;

-- *주의*
-- 그룹함수는 일반 컬럼과 동시에 출력할 수 없다.
SELECT
    department_id,
    AVG(salary)
FROM employees; -- 에러

-- GROUP BY를 사용할 때 GROUP에 묶이지 않으면 다른 컬럼을 조회할 수 없다.
SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; -- 에러

-- GROUP BY 2개 이상 사용
SELECT
    job_id,
    department_id
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

-- GROUP BY의 조건 HAVING
SELECT 
    department_id,
    SUM(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;

SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 20;

-- 부서아이디가 50이상인 것들을 그룹화 시키고, 그룹 월급 평균 중 5000 이상만 조회
SELECT
    department_id,
    AVG(salary) AS 평균
FROM employees
WHERE department_id >= 50
GROUP BY department_id
HAVING AVG(salary) >= 5000;


-- 문제1.
-- 사원 테이블에서 JOB_ID별 사원수를 구한다.
-- 사원 테이블에서 JOB_ID별 월급의 평균을 구하고 월급의 평균 순으로 내림차순 정렬
SELECT
    job_id,
    COUNT(*) AS 사원수
FROM employees
GROUP BY job_id;

SELECT
    job_id,
    AVG(salary) AS 평균월급
FROM employees
GROUP BY job_id
ORDER BY AVG(salary) DESC;

-- 문제2.
-- 사원 테이블에서 입사 년도 별 사원수를 구한다.
SELECT
    TO_CHAR(hire_date, 'YY'),
    COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YY');

-- 문제3.
-- 급여가 8000이상인 사원들의 부서별 평균 급여를 출력. 단 부서 평균 급여가 5000이상인 부서만 출력
SELECT
    department_id,
    AVG(salary)
FROM employees
WHERE salary >= 8000
GROUP BY department_id
HAVING AVG(salary) >= 5000;

-- 문제4.
-- 사원 테이블에서 commission_pct(커미션) 컬럼 중 null이 아닌 사람들의 department_id(부서별) salary(월급)의 평균, 합계, count를 구한다.
-- 조건1) 월급의 평균은 커미션을 적용시킨 월급
-- 조건2) 평균은 소수 2째 자리에서 절삭
SELECT
    department_id,
    TRUNC(AVG(salary + salary * commission_pct), 2) AS 평균,
    SUM(salary + salary * commission_pct) AS 합계,
    COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;