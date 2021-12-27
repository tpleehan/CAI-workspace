-- NUMBER(2) -> 정수를 2자리까지 저장할 수 있는 숫자형 타입
-- NUMBER(5, 2) -> 정수부, 실수부를 합친 총 자리수 5자리, 소수점 2자리 EX) 123.45
-- NUMBER -> 괄호를 생략할 시 (38, 0)으로 자동 지정된다.
-- VARCHAR2(byte) -> 괄호 안에 들어올 문자열의 최대 길이를 지정
--                   영어는 1byte, 한글은 2byte로 인식한다. EX) VARCHAR2(14) 영어는 14글자 / 한글은 7글자

CREATE TABLE dept2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(15),
    dept_date DATE,
    dept_bonus NUMBER(10)
);

DESC dept2;

SELECT * FROM dept2;

-- NUMBER타입에 들어가는 자리수를 확인
INSERT INTO dept3
VALUES (99, '영업직', '서울', sysdate, 2000000);

-- 컬럼 추가
ALTER TABLE dept2
ADD (dept_count NUMBER(3));

-- 열 이름 변경
ALTER TABLE dept2
RENAME COLUMN dept_count TO emp_count;

SELECT * FROM dept3;

-- 열 속성 수정
ALTER TABLE dept2
MODIFY (emp_count NUMBER(4)); -- 문자를 숫자로 수정할 경우 신중하게 생각해야 한다. EX) MODIFY (emp_count VARCHAR(30));

DESC dept2;

-- 열 속성 삭제
ALTER TABLE dept2
DROP COLUMN emp_count;

ALTER TABLE dept2
RENAME TO dept3;

-- 테이블 삭제 (구조는 남겨두고 내부 데이터만 모두 삭제)
TRUNCATE TABLE dept3;

SELECT * FROM dept3;

DROP TABLE dept3; 