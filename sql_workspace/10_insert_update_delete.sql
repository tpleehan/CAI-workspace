-- INSERT
-- 테이블 구조 확인 DESCRIBE
DESCRIBE departments;
DESC departments; -- DESCRIBE 대신 DESC를 사용해도 된다.

-- INSERT의 첫 번째 방법 (모든 컬럼 데이터를 한번에 지정)
-- 타입에 맞는 값을 지정해서 삽입해야 한다.
-- 문자나 숫자 타입으로 지정된 곳에 타입이 맞지 않는 데이터를 집어 넣을 때는 자동 형변환을 해준다.
INSERT INTO departments 
VALUES (280, '개발자', null, 1700);

INSERT INTO departments 
VALUES ('300', '개발자', null, 1700);

INSERT INTO departments 
VALUES ('300', null, null, 1700); -- 오류 2번째 null을 넣을 수 없다.

INSERT INTO departments 
VALUES ('301', 23.3, null, 1700);

INSERT INTO departments 
VALUES ('300', 23.3, null, 1700);

INSERT INTO departments 
VALUES ('301%', 23.3, null, 1700); -- 오류 1번째 특수기호를 넣을 수 없다.

SELECT * FROM departments;
ROLLBACK; -- 실행 시점을 다시 뒤로 돌리는 키워드

-- INSERT의 두 번째 방법 (직접 컬럼을 지정하고 저장)
INSERT INTO departments 
(department_id, department_name, location_id)
VALUES (280, '개발자', 1700);

-- INSERT 연습
INSERT INTO departments 
(department_id, department_name, location_id)
VALUES (290, '디자이너', 1700);

INSERT INTO departments 
(department_id, department_name, location_id)
VALUES (300, 'DB관리자', 1800);

INSERT INTO departments 
(department_id, department_name, manager_id, location_id)
VALUES (310, '데이터분석가', null, 1800);

INSERT INTO departments 
VALUES (320, '퍼블리셔', 200, 1800);

INSERT INTO departments 
(department_id, department_name, manager_id, location_id)
VALUES (330, '서버관리자', 200, 1800);

SELECT * FROM departments;
ROLLBACK;

-- 사본 테이블 생성
CREATE TABLE managers AS
(
SELECT employee_id, first_name, job_id, salary, hire_date
FROM employees
WHERE 1 = 2 -- false를 뜻한다.  
);
-- 1 = 1 -> true 
-- 1 = 2 -> false

SELECT * FROM managers;

-- INSERT(서브쿼리)
INSERT INTO managers
(
SELECT employee_id, first_name, job_id, salary, hire_date
FROM employees
);

-- UPDATE
CREATE TABLE emps AS (SELECT * FROM employees);
SELECT * FROM emps;

-- CTAS를 사용하면 제약 조건은 NOT NULL 말고는 복사되지 않는다.
-- 제약조건은 업무규칙을 지키는 데이터만 저장하고, 
-- 그렇지 않은 것들은 DB에 저장되는 것을 방지하는 목적으로 사용한다.
ALTER TABLE emps
ADD (CONSTRAINT emps_emp_id_pk PRIMARY KEY (employee_id),
     CONSTRAINT emps_manager_fk FOREIGN KEY (manager_id)
     REFERENCES emps(employee_id));

-- 제약조건 삭제
ALTER TABLE emps DROP CONSTRAINT emps_manager_fk;
ALTER TABLE emps DROP CONSTRAINT emps_emp_id_pk;

-- UPDATE를 진행할 때는 누구를 수정할 지 지목해야 한다.
-- 지목을 하지 않을 경우 수정 대상이 테이블 전체로 지목된다.
UPDATE emps SET salary = 30000;
SELECT * FROM emps;
rollback;

UPDATE emps SET salary = 30000
WHERE employee_id = 100;

UPDATE emps SET salary = salary + salary * 0.1
WHERE employee_id = 100;

UPDATE emps SET manager_id = 100
WHERE employee_id = 100;

SELECT * FROM emps;

UPDATE emps SET
phone_number = '515.123.4566', manager_id = 102
WHERE employee_id = 100;

-- UPDATE (서브쿼리)
UPDATE emps
SET (job_id, salary, manager_id) =
    (SELECT job_id, salary, manager_id
     FROM emps
     WHERE employee_id = 100)
WHERE employee_id = 101;     

SELECT * FROM emps;
ROLLBACK;

-- DELETE
DELETE FROM emps
WHERE employee_id = 103;

SELECT * FROM emps
WHERE employee_id = 103;

-- DELETE (서브쿼리)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                       WHERE department_id = 100);
SELECT * FROM emps;

DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                       WHERE department_name = 'IT');

DELETE FROM departments WHERE department_id = 50;