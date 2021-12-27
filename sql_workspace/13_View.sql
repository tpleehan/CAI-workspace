/*
- view는 제한적인 자료만 보기 위해 사용하는 가상테이블의 개념이다.
- 뷰는 기본 테이블로 유도된 가상 테이블이기 때문에 필요한 컬럼만 저장해 두면 관리가 용이해 진다.
- 뷰는 가상테이블로 실제 데이터가 물리적으로 저장된 형태는 아니다.
- 뷰를 통해서 데이터에 접근하면 원본 데이터는 안전하게 보호될 수 있다.
*/

SELECT * FROM user_sys_privs;

-- 단순 뷰
-- 뷰의 컬럼 이름은 함수 같은 가상 표현식이면 안된다.
SELECT 
    employee_id,
    first_name || ' ' || last_name AS name,
    job_id,
    salary
FROM employees
WHERE department_id = 60;

CREATE VIEW view_emp AS (
    SELECT 
        employee_id,
        first_name || ' ' || last_name AS name,
        job_id,
        salary
    FROM employees
    WHERE department_id = 60
);

SELECT * FROM view_emp;

-- 복합 뷰
-- 여러 테이블을 조인하여 필요한 데이터만 저장하고 빠른 확인을 위해 사용
CREATE VIEW view_emp_dept_jobs AS (
    SELECT
        e.employee_id,
        e.first_name || ' ' || e.last_name AS name,
        d.department_name,
        j.job_title
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
)
ORDER BY e.employee_id ASC;

SELECT * FROM view_emp_dept_jobs;

-- VIEW 수정 (CREATE OR REPLACE VIEW 구문)
-- 동일이름으로 해당 구문을 사용하면 데이터가 변경되면서 새롭게 생성된다.
CREATE OR REPLACE VIEW view_emp_dept_jobs AS (
    SELECT
        e.employee_id,
        e.first_name || ' ' || e.last_name AS name,
        d.department_name,
        j.job_title,
        e.salary -- 컬럼 추가
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
)
ORDER BY e.employee_id ASC;

SELECT * FROM view_emp_dept_jobs;

SELECT  
    job_title,
    AVG(salary)
FROM view_emp_dept_jobs
GROUP BY job_title
ORDER BY AVG(salary) DESC;

-- VIEW 삭제
DROP VIEW view_emp;

/*
VIEW에 INSERT를 하는 경우 실제 테이블에도 반영이 된다.
VIEW의 INSERT, UPDATE, DELETE는 많은 제약사항이 따른다.
원본 테이블이 NOT NULL인 경우 VIEW에 INSERT가 불가능하다.
VIEW에서 사용하는 컬럼이 가상열인 경우에도 INSERT가 안된다.
*/

-- name은 가상열(virtual column)이기 때문에 INSERT가 안된다.
INSERT INTO view_emp_dept_jobs
VALUES(300, 'test', 'test', 10000); 

-- JOIN된 뷰의 경우 한번에 수정할 수 없다.
INSERT INTO view_emp_dept_jobs
(employee_id, department_name, job_title, salary)
VALUES (300, 'test', 'test', 'test'); 

-- 원본 테이블의 null을 허용하지 않는 컬럼 때문에 INSERT가 안된다.
INSERT INTO view_emp
(employee_id, job_id, salary)
VALUES (300, 'test', 10000);

-- WITH CHECK OPTION (조건 제약 컬럼)
-- 조건에 사용되어진 컬럼값은 뷰를 통해서 변경할 수 없게 해주는 키워드
CREATE VIEW view_emp_test AS (
    SELECT
        employee_id,
        first_name,
        last_name,
        hire_date,
        job_id,
        department_id
    FROM employees
    WHERE department_id = 60
)
WITH CHECK OPTION CONSTRAINT view_emp_test_ck;
-- view WITH CHECK OPTION (변경을 막아주는 에러)

UPDATE view_emp_test
SET department_id = 100
WHERE employee_id = 105; -- 에러: where-clause violation 

-- 읽기 전용 뷰 (WITH READ ONLY (DML 연산을 막는다.))
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT
        employee_id,
        first_name,
        last_name,
        hire_date,
        job_id,
        department_id
    FROM employees
    WHERE department_id = 60
)
WITH READ ONLY;

INSERT INTO view_emp_test
VALUES (300, 'test', 'test', sysdate, 'IT_PROG', 100); -- 에러: cannot perform a DML operation on a read-only view

UPDATE view_emp_test
SET last_name = 'kim'
WHERE employee_id = 103; -- 에러: cannot perform a DML operation on a read-only view
