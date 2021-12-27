-- Sequence (순차적으로 증가하는 값을 만들어주는 객체)
SELECT * FROM user_sequences; -- 사용중인 시퀀스 객체 조회

-- Sequence 생성
CREATE SEQUENCE dept3_seq 
    START WITH 1 -- 시작값 (기본값이 증가할 때는 최소값, 감소할 때는 최대값)
    INCREMENT BY 1 -- 증가값 (기본값이 양수면 증가 음수면 감소, 기본값 1) 2, 10, 100 등 설정가능
    -- MINVALUE 1 -- 최소값 (기본값이 증가할 때 1, 감소할 때 -1028)
    MAXVALUE 10 -- 최대값 (기본값이 증가할 때 1027, 감소할 때 -1)
    NOCYCLE -- 순환 여부 CYCLE / NOCYCLE (기본값이 NOCYCLE)
    NOCACHE; -- 캐시메모리 여부 CACHE / NOCACHE (기본값이 CACHE 기본)
    

CREATE TABLE dept3 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(13),
    dept_date DATE
);

SELECT * FROM dept3;

-- Sequence 사용 (NEXTVAL, CURRVAL)
INSERT INTO dept3
VALUES (dept3_seq.NEXTVAL, 'test', 'test', sysdate );

SELECT dept3_seq.CURRVAL FROM dual;

SELECT dept3_seq.NEXTVAL FROM dual; -- NEXTVAL를 사용하면 값이 증가한다.

-- Sequence 수정 (직접 수정 가능)
-- START WITH은 수정이 불가능하다.
ALTER SEQUENCE dept3_seq MAXVALUE 9999; -- 최개값 증가
ALTER SEQUENCE dept3_seq  INCREMENT BY -1; -- 최대값
ALTER SEQUENCE dept3_seq MINVALUE 1; -- 최소값

-- Sequence 값을 다시 처음으로 돌리는 방법 (삭제하는 것이 
SELECT dept3_seq.CURRVAL FROM dual;
ALTER SEQUENCE dept3_seq INCREMENT BY -9;
SELECT dept3_seq.NEXTVAL FROM dual;
ALTER SEQUENCE dept3_seq INCREMENT BY 1;

DROP SEQUENCE dept3_seq;


/*
- index는 primary key, unique 제약 조건에서 자동으로 생성되고
  조회를 빠르게 해 주는 hint 역할을 한다.
- index는 조회를 빠르게 하지만 무작위하게 많은 인덱스를 생성해서
  사용하면 오히려 성능 부하를 일으킬 수 있다.
- 정말 필요할 때 index를 사용하는 것이 올바르다.
*/

SELECT * FROM employees WHERE first_name = 'Nancy';

-- index 추가
CREATE INDEX emp_first_name_idx ON employees(first_name);
-- index 삭제
DROP INDEX emp_first_name_idx;

-- Sequence와 index를 사용하는 hint 방법
CREATE SEQUENCE board_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE tbl_board (
    bno NUMBER(10) PRIMARY KEY,
    writer VARCHAR(20)
);

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'test');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'admin');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'hong');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'kim');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'test');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'admin');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'hong');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'kim');

SELECT * FROM tbl_board;

COMMIT;

-- 인덱스 이름 변경
ALTER INDEX SYS_C007333
RENAME TO tbl_board_idx;

SELECT *
FROM
    (    
        SELECT /*+ INDEX_DESC (tbl_board tbl_board_idx) */ -- 주석에 /*+ 띄어쓰기 유의
            ROWNUM AS rn,
            bno,
            writer
        FROM tbl_board
    )
WHERE rn > 10 AND rn <= 20;

/*
- 인덱스가 권장되는 경우
1. 컬럼이 WHERE 또는 JOIN 조건에서 자주 사용되는 경우
2. 열이 광범위한 값을 포함하는 경우
3. 테이블이 대형인 경우
4. 타겟 컬럼이 많은 수의 null 값을 포함하는 경우
5. 테이블이 자주 수정되고, 이미 하나 이상의 인덱스를 가지고 있는 경우 권장하지 않는다.
*/
