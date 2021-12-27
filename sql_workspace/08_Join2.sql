-- INNER JOIN
-- ANSI 문법
SELECT *
FROM info INNER JOIN auth
ON info.auth_id = auth.auth_id;

--ORACEL 문법
SELECT *
FROM info, auth
WHERE info.auth_id = auth.auth_id;

-- auth_id 컬름을 그냥 사용할 경우 ambiguously defined (모호하다) 오류 발생
-- 양쪽 테이블이 auth_id가 모두 존재하기 때문이다.
-- 컬럼에 테이블 이름을 사용하거나 별칭을 줘서 확실하게 지목을 해야 한다.
SELECT info.auth_id, title, content, name
FROM info INNER JOIN auth
ON info.auth_id = auth.auth_id;

-- 필요한 데이터만 조회할 경우
-- WHERE 구문을 통해 일반 조건을 작성하면 된다.
SELECT 
    i.auth_id, i.title, i.content, a.name
FROM info i INNER JOIN auth a
ON i.auth_id = a.auth_id
WHERE a.name = '홍길자';

-- OUTER JOIN
SELECT *    
FROM info i LEFT OUTER JOIN auth a
ON i.auth_id = a.auth_id;

SELECT *    
FROM info i RIGHT OUTER JOIN auth a
ON i.auth_id = a.auth_id;

-- 오라클 문법
SELECT *
FROM info i, auth a
WHERE i.auth_id = a.auth_id(+); -- LEFT JOIN

-- FULL JOIN (좌측 테이블과 우측 테이블 데이터를 모두 확인하여 중복된 데이터는 삭제하는 외부 조인)
SELECT *    
FROM info i FULL OUTER JOIN auth a
ON i.auth_id = a.auth_id;

-- CROSS JOIN (JOIN 조건을 설정하지 않기 때문에 모든 컬럼에 대해 JOIN을 진행. 많이 사용되지 않는다.)
SELECT *
FROM info CROSS JOIN auth
ORDER BY id ASC;

-- 여러 테이블 조인 -> 키 값만 찾아서 구문을 연결해서 사용한다.
SELECT *
FROM employees e 
LEFT OUTER JOIN departments d ON e.department_id = d.department_id
LEFT OUTER JOIN locations loc ON d.department_id = loc.location_id;

/*
- 테이블 별칭 a, i를 이용하여 LEFT OUTER JOIN 사용
- info, auth 테이블을 사용
- job 컬럼이 scientist인 사람의 id, title, content, job을 출력
*/
SELECT 
    i.id, i.title, i.content, a.job
FROM auth a LEFT OUTER JOIN info i
ON i.auth_id = a.auth_id
WHERE a.job = 'scientist';