-- 조인이란?
-- 서로 다른 테이블간에 설정된 관계가 결합하여 
-- 1개 이상의 테이블에서 데이터를 조회하기 위해 사용된다.
-- SELECT 컬럼리스트 FROM 조인대상이 되는 테이블
-- WHERE 조인 조건

-- employees 테이블의 부서 id와 일치하는 departments 테이블의 부서 id를 찾아서
-- SELECT 이하에 있는 컬럼들을 출력하는 쿼리문
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    e.salary,
    e.job_id,
    e.department_id,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    e.salary,
    e.job_id,
    e.department_id,
    d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id;
-- INNER JOIN (내부 조인)
/*
각각의 테이블에 독립적으로 존재하는 컬럼의 경우 별칭을 생략해도 무방하다.
그러나 해석의 명확성을 위해 테이블 이름을 작성하여 소속을 표현하는 것이 바람직하다.
테이블 이름이 길 경우 ALIAS를 작성하여 칭한다.
두 테이블 모두 가지고 있는 컬럼의 경우 반드시 별칭을 명시해야 한다.
*/

-- 3개의 테이블을 이용한 내부 조인
-- 내부 조인: 두 테이블 모두에서 일치하는 값을 가진 행만 반환
SELECT 
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name,
    j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;

SELECT 
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name,
    j.job_title
FROM employees e INNER JOIN departments d
                         ON e.department_id = d.department_id
                 INNER JOIN jobs j
                         ON e.job_id = j.job_id;

-- 조인조건과 함께 사용되는 일반 조건이 있을 경우
SELECT 
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name,
    e.job_id,
    j.job_title,
    loc.city
FROM employees e,
     departments d,
     jobs j,
     locations loc
WHERE e.department_id = d.department_id -- 3)
AND e.job_id = j.job_id -- 4)
AND d.location_id = loc.location_id -- 2)
AND loc.state_province = 'California'; -- 1)
/*
1) loc 테이블의 province = 'California' 조건에 맞는 값을 대상으로
2) location_id값과 같은 값을 가진 데이터를 departments에서 찾아서 조인
3) 위의 결과와 동일한 department_id를 가진 employees 테이블의 데이터를 찾아 조인
4) 위의 결과와 jobs 테이블을 비교하여 조인하고 최종결과를 최종 결과를 출력
*/


-- OUTER JOIN (외부조인)
/*
상호 테이블간에 일치되는 값으로 연결되는 내부 조인과 다르게
어느 한 테이블에 공통 값이 없더라도 해당 ROW들이 조회 결과에 모두 포함되는 조인을 말한다.
*/
SELECT 
    e.employee_id,
    e.first_name,
    e.department_id,
    d.department_name
FROM employees e, departments d, locations loc
WHERE e.department_id = d.department_id
AND d.location_id = loc.location_id;

SELECT 
    e.employee_id,
    e.first_name,
    e.department_id,
    d.department_name
FROM employees e, departments d, locations loc
WHERE e.department_id = d.department_id(+)
AND d.location_id = loc.location_id; -- 외부 조인과 내부 조인을 사용할 경우 내부조인이 우선적이다.
/*
employees 테이블에는 존재하고, departments 테이블에 존재하지 않더라도
(+) 기호가 붙지 않은 테이블을 기준으로 하여 
departments 테이블이 조인에 참여하라는 의미를 부여하기 위해 기호를 붙인다.
외부 조인을 사용하더라도 이후 내부 조인을 사용할 경우 내부조인을 우선적으로 인식하게 된다.
*/

-- 외부 진행 진행 시 모든 조건에 (+)를 붙여야 하며
-- 일반 조건에도 (+)를 붙이지 않으면 데이터가 누락되는 현상이 발생한다.
SELECT 
    e.employee_id,
    e.first_name,
    e.department_id,
    j.start_date,
    j.end_date,
    j.job_id
FROM employees e, job_history j
WHERE e.employee_id = j.employee_id;

SELECT 
    e.employee_id,
    e.first_name,
    e.department_id,
    j.start_date,
    j.end_date,
    j.job_id
FROM employees e, job_history j
WHERE e.employee_id = j.employee_id(+)
AND j.department_id(+) = 80;