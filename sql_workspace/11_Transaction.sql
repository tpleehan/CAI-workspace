-- Auto Commit 확인
SHOW AUTOCOMMIT;
-- AUTO COOMMIT on
SET AUTOCOMMIT ON;
-- AUTO COOMMIT off
SET AUTOCOMMIT OFF;

SELECT * FROM emps;

INSERT INTO emps
(employee_id, last_name, email, hire_date, job_id)
VALUES (300, 'kim', 'abc@naver.com', sysdate, 1800);

-- 보류 중인 모든 데이터 변경사항을 취소(폐기), 직전 커밋 단계 회귀(돌아가기) 트랜잭션 종료.
ROLLBACK;

DELETE FROM emps
WHERE last_name = 'kim';

-- SAVAPOINT 생성
-- ROLLBACK할 포인트를 직접 이름을 붙여서 지정
-- ANSI 표준 문법이 아니기 때문에 권장하지 않는다.
SAVEPOINT delete_kim;

ROLLBACK TO SAVEPOINT delete_kim;



INSERT INTO emps
(employee_id, last_name, email, hire_date, job_id)
VALUES (301, 'Park', 'park@naver.com', sysdate, 1800);



-- 보류 중인 모든 데이터 변경사항을 영구적으로 적용하면서 트랜잭션 종료.
-- commit 이후에는 어떤 방법을 사용하더라도 되돌릴 수 없다.
COMMIT;