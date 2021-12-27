-- 사용자 계정 확인
SELECT * FROM all_users;

-- 계정 생성 명령
CREATE USER user1 IDENTIFIED BY user1;

-- DCL: GRANT(권한 부여), REVOKE(권한 회수)
/*
CREATE USER : 데이터베이스 유저 생성 권한
CREATE SESSION : 데이터베이스 접속 권한
CREATE TABLE : 테이블 생성 권한
CREATE VIEW : 뷰 생성 권한
CREATE SEQUENCE : 시퀀스 생성 권한
ALTER ANY TABLE : 어떠한 테이블도 수정할 수 있는 권한
INSERT ANY TABLE, SELECT ANY TABLE ...

SELECT ON [table name] TO [user]; : 특정 테이블만 조회할 수 있는 권한

RESOURCE, CONNECT, DBA TO [user]
*/
GRANT CREATE SESSION TO user1;
GRANT CONNECT, RESOURCE, DBA TO user1;

ALTER USER user1 IDENTIFIED BY abc1234;

/*
- 테이블 스페이스는 데이터베이스 객체 내 실제 데이터가 저장되는 공간
- 테이블 스페이스를 생성하면 지정된 경로에 실제 파일로 정의한 용량만큼의
  파일이 생성이 되고, 데이터가 물리적으로 저장된다.
- 테이블 스페이스의 용량이 초과되면 프로그램이 비정상적으로 동작한다.
*/

SELECT * FROM dba_tablespaces;

-- USERS 테이블 스페이스를 기본 사용 공간으로 지정.
ALTER USER user1 DEFAULT TABLESPACE USER_TABLESPACE
QUOTA UNLIMITED ON USER_TABLESPACE;

-- 테이블 스페이스 내의 객체를 전체 삭제
DROP TABLESPACE USER_TABLESPACE INCLUDING CONTENTS;
-- 테이블 스페이스 파일까지 한번에 삭제
DROP TABLESPACE USER_TABLESPACE INCLUDING CONTENTS AND DATAFILES;

-- 사용자 계정 삭제 (종속된 객체나 데이터가 존재 시 삭제 불가능)
DROP USER user1;
-- 계정 삭제 시 테이블, 시퀀스 등 종속되어 있는 모든 객체도 함께 삭제
DROP USER user1 CASCADE;
