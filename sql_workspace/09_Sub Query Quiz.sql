-- 문제1.
-- EMPLOYEES 테이블에서 모든 사원의 평균급여보다 높은 사원들을 데이터로 출력(AVG(컬럼) 사용)
-- EMPLOYEES 테이블에서 모든 사원의 평균급여보다 높은 사원들의 수를 출력
-- EMPLOYEES 테이블에서 job_id가 IT_PROG인 사원들의 평균급여보다 높은 사원들의 데이터를 출력
SELECT * FROM employees   
WHERE salary >  (SELECT AVG(salary)
                 FROM employees);

SELECT COUNT(*) FROM employees   
WHERE salary >  (SELECT AVG(salary)
                 FROM employees);

SELECT * FROM employees   
WHERE salary >  (SELECT AVG(salary)
                 FROM employees
                 WHERE job_id = 'IT_PROG');

-- 문제2.
-- DEPARTMENTS테이블에서 manager_id가 100인 사람의 department_id와 EMPLOYEES 테이블에서
-- department_id가 일치하는 모든 사원의 정보를 검색한다.
SELECT *
FROM employees
WHERE department_id = (SELECT department_id
                        FROM departments 
                        WHERE manager_id = 100);

-- 문제3.
-- EMPLOYEES테이블에서 "Pat"의 manager_id보다 높은 manager_id를 가진 모든 사원의 데이터를 출력
-- EMPLOYEES테이블에서 "James"(2명)들의 manager_id와 갖는 모든 사원의 데이터를 출력

SELECT * FROM employees
WHERE manager_id > (SELECT manager_id
                    FROM employees
                    WHERE first_name = 'Pat');

SELECT * FROM employees
WHERE manager_id IN (SELECT manager_id
                     FROM employees
                     WHERE first_name = 'James');

-- 문제4.
-- EMPLOYEES테이블에서 first_name 기준으로 내림차순 정렬하고, 41~50번째 데이터의 행 번호, 이름을 출력
SELECT * FROM
    (
    SELECT ROWNUM AS rn, first_name FROM
         (
         SELECT * FROM employees
         ORDER BY first_name DESC
         )
    )
WHERE rn > 40 AND rn <= 50;

-- 문제5.
-- EMPLOYEES테이블에서 hire_date 기준으로 오름차순 정렬하고, 
-- 31~40번째 데이터의 행 번호 사원id, 이름, 핸드폰번호, 입사일 출력
SELECT * FROM
    (
    SELECT ROWNUM AS rn, employee_id, first_name, phone_number, hire_date FROM
         (
         SELECT * FROM employees
         ORDER BY hire_date ASC
         )
    )
WHERE rn > 30 AND rn <= 40;

SELECT * FROM
    (
    SELECT ROWNUM AS rn, tbl.* FROM
         (
         SELECT employee_id, first_name, phone_number, hire_date FROM employees
         ORDER BY hire_date ASC
         ) tbl
    )
WHERE rn > 30 AND rn <= 40;

-- 문제6.
-- employees 테이블 departments 테이블을 left join
-- 조건) 직원아이디, 이름(성, 이름), 부서아이디, 부서명만 출력
-- 조건) 직원아이디 기준 오름차순 정렬
SELECT
    e.employee_id,
    CONCAT(e.first_name, e.last_name) AS 이름,
    e.department_id,
    d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.employee_id ASC;

-- 문제7.
-- 문제6의 결과를 (스칼라 쿼리)로 동일하기 조회
SELECT
    e.employee_id,
    CONCAT(first_name, last_name) AS 이름,
    e.department_id,
    (
    SELECT d.department_name
    FROM departments d
    WHERE e.department_id = d.department_id
    ) AS department_name
FROM employees e
ORDER BY e.employee_id ASC;

-- 문제8.
-- departments테이블 locations테이블을 left조인
-- 조건) 부서아이디, 부서이름, 매니저아이디, 로케이션아이디, 스트릿_어드레스, 포스탈 코드, 시티만 출력
-- 조건) 부서아이디 기준 오름차순 정렬
SELECT 
    d.department_id, 
    d.department_name, 
    d.manager_id, 
    d.location_id,
    loc.street_address, 
    loc.postal_code, 
    loc.city 
FROM departments d LEFT OUTER JOIN locations loc
ON d.location_id = loc.location_id
ORDER BY d.department_id ASC;

-- 문제9.
-- 문제8의 결과를 (스칼라 쿼리)로 동일하게 조회
SELECT
    d.department_id, 
    d.department_name, 
    d.manager_id, 
    d.location_id,
    (SELECT loc.street_address 
     FROM locations loc
     WHERE d.location_id = loc.location_id) AS street_address,
    (SELECT loc.postal_code
     FROM locations loc
     WHERE d.location_id = loc.location_id) AS postal_code,
    (SELECT loc.city
     FROM locations loc
     WHERE d.location_id = loc.location_id) AS city
     -- 스칼라 서브의 경우 반드시 한 행 한컬럼만 리턴하는 서브쿼리이다.
     -- 단일행, 한 컬럼만 반환하기 때문에 조회할 행의 값을 반환하려면 하나씩 작성해야 한다.
FROM departments d
ORDER BY d.department_id ASC;

-- 문제10.
-- locations 테이블 countries 테이블을 left조인
-- 조건) 로케이션아이디, 주소, 시티, country_id, country_name만 출력
-- 조건) country_name 기준 오름차순 정렬
SELECT 
    loc.location_id,
    loc.street_address,
    loc.city, 
    loc.country_id, 
    c.country_name
FROM locations loc LEFT OUTER JOIN countries c
ON loc.country_id = c.country_id
ORDER BY c.country_name ASC;

-- 문제11.
-- 문제10의 결과를 (스칼라 쿼리)로 동일하게 조회
SELECT
    loc.location_id,
    loc.street_address,
    loc.city, 
    loc.country_id,
    (
    SELECT country_name 
    FROM countries c
    WHERE loc.country_id = c.country_id
    ) AS country_name
FROM locations loc
ORDER BY country_name ASC;

-- 문제12.
-- employees테이블, departments 테이블을 left 조인 hire_date를 오름차순 기준으로 1 ~ 10 번째 데이터만 출력한다.
-- 조건) rownum 을 적용하여 번호, 직원아이디, 이름, 전화번호, 입사일, 부서아이디, 부서이름을 출력한다.
-- 조건) hire_date를 기준으로 오름차순 정렬 되어야 하고 rownum이 틀어지면 안 된다.
SELECT * 
    FROM
    (
    SELECT ROWNUM AS rn, tbl.*
        FROM 
        (
        SELECT 
            e.employee_id,
            e.first_name,
            e.phone_number,
            e.hire_date,
            d.department_id,
            d.department_name
        FROM employees e LEFT OUTER JOIN departments d
        ON e.department_id = d.department_id
        ORDER BY hire_date ASC
        ) tbl
    )
WHERE rn >= 1 AND rn <= 10;

-- Scalar SubQuery
SELECT * 
    FROM
    (
    SELECT ROWNUM AS rn, tbl.*
        FROM 
        (
        SELECT 
            e.employee_id,
            e.first_name,
            e.phone_number,
            e.hire_date,
            e.department_id,
            (
		    SELECT department_name 
		    FROM departments d
		    WHERE e.department_id = d.department_id
		    ) AS department_name
        FROM employees e 
        ORDER BY hire_date ASC
        ) tbl
    )
WHERE rn >= 1 AND rn <= 10;

-- 문제13.
-- EMPLOYEES와 DEPARTMENTS 테이블에서 JOB_ID가 'SA_MAN' 사원 정보의 
-- LAST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME을 출력한다.
SELECT 
    e.last_name,
    e.job_id,
    d.department_id,
    d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
WHERE job_id = 'SA_MAN';

SELECT a.*, d.department_name
FROM
    (
    SELECT 
        last_name,
        job_id,
        department_id
    FROM employees
    WHERE job_id = 'SA_MAN'
    ) a
JOIN departments d
ON a.department_id = d.department_id;

-- Scalar SubQuery
SELECT 
    e.last_name,
    e.job_id,
    (
    SELECT department_id 
    FROM departments d
    WHERE e.department_id = d.department_id
    ) AS department_id,
    (
    SELECT department_name 
    FROM departments d
    WHERE e.department_id = d.department_id
    ) AS department_name
FROM employees e
WHERE job_id = 'SA_MAN';

-- 문제14.
-- DEPARTMENTS 테이블에서 각 부서의 ID, NAME, MANAGER_ID와 부서에 속한 인원수를 출력한다.
-- 인원수 기준 내림차순 정렬 후 사람이 없는 부서는 출력하지 않는다.
SELECT
    d.department_id,
    d.department_name,
    d.manager_id,
    a.total
FROM departments d
INNER JOIN (
        SELECT
            department_id,
            COUNT(*) AS total
        FROM employees e
        GROUP BY department_id
     ) a
ON d.department_id = a.department_id
ORDER BY a.total DESC;

SELECT
    d.department_id,
    d.department_name,
    d.manager_id,
    c.cnt
FROM departments d
LEFT JOIN (
        SELECT
            e.department_id,
            COUNT(*) AS cnt
        FROM employees e
        GROUP BY e.department_id
     ) c
ON d.department_id = c.department_id
WHERE c.department_id IS NOT NULL
ORDER BY cnt DESC;

-- 문제15.
-- 부서에 대한 정보 전부, 주소, 우편번호, 부서별 평균 연봉을 구해서 출력한다.
-- 부서별 평균이 없으면 0 으로 출력한다.
SELECT d.*,
       loc.street_address,
       loc.postal_code,
       nvl(a.salary, 0) AS salary
FROM departments d LEFT JOIN
    (
    SELECT e.department_id, 
           TO_CHAR(TRUNC(AVG(salary * 12), 0), '999,999') AS salary
    FROM employees e LEFT JOIN departments d
    ON e.department_id = d.department_id 
    GROUP BY e.department_id
    ) a
ON d.department_id = a.department_id
LEFT JOIN locations loc
ON d.location_id = loc.location_id;

SELECT 
    d.*,
    loc.street_address,
    loc.postal_code,
    nvl(a.result, 0) AS 부서별평균급여
FROM departments d
INNER JOIN locations loc
ON d.location_id = loc.location_id
LEFT OUTER JOIN 
    (
    SELECT department_id, 
           TRUNC(AVG(salary * 12)) AS result
    FROM employees
    GROUP BY department_id
    ) a
ON d.department_id = a.department_id;

-- 문제16.
-- 문제15. 결과에 대해 DEPARTMENT_ID 기준으로 내림차순 정렬해서 ROWNUM 을 붙여 1 ~ 10 데이터까지만 출력한다.
SELECT *
FROM
    (
    SELECT ROWNUM AS rn, tbl.*
        FROM(
        SELECT d.*,
               loc.city,
               loc.postal_code,
               nvl(a.salary, 0) as salary
        FROM departments d LEFT JOIN
            (
            SELECT e.department_id, 
                   to_char(trunc(avg(salary * 12), 0), '999,999') as salary
            FROM employees e LEFT JOIN departments d
            ON e.department_id = d.department_id 
            GROUP BY e.department_id
            ) a
        ON d.department_id = a.department_id
        LEFT JOIN locations loc
        ON d.location_id = loc.location_id
        ORDER BY d.department_id
        ) tbl
    )
WHERE rn >= 1 AND rn <= 10;

SELECT * 
FROM
    (
    SELECT ROWNUM AS rn, tbl.*
    FROM
        (
        SELECT 
            d.*,
            loc.street_address,
            loc.postal_code,
            nvl(a.result, 0) AS 부서별평균급여
        FROM departments d
        INNER JOIN locations loc
        ON d.location_id = loc.location_id
        LEFT OUTER JOIN 
            (
            SELECT department_id, 
                   TRUNC(AVG(salary * 12)) AS result
            FROM employees
            GROUP BY department_id
            ) a
        ON d.department_id = a.department_id
        ) tbl
    )
WHERE rn >= 1 AND rn <= 10;