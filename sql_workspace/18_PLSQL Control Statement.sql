-- IF문
DECLARE
    v_num1 NUMBER := 10;
    v_num2 NUMBER := 5;
BEGIN
    IF
        v_num1 >= v_num2
    THEN
        DBMS_OUTPUT.PUT_LINE(v_num1 || '이(가) 큰 수');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num2 || '이(가) 큰 수');
    END IF;
END;

-- ELSIF문
DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 120), -1);
    
    SELECT salary
    INTO v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; -- 첫째 값만 구해서 변수에 저장
    
    DBMS_OUTPUT.PUT_LINE(v_salary);
    
    IF v_salary <= 5000 THEN
        DBMS_OUTPUT.PUT_LINE('낮음');
    ELSIF v_salary <= 9000 THEN
        DBMS_OUTPUT.PUT_LINE('중간');
    ELSE
        DBMS_OUTPUT.PUT_LINE('높음');
    END IF;
END;

-- CASE 문
DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 120), -1);
    
    SELECT salary
    INTO v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE(v_salary);
    
    CASE
        WHEN v_salary <= 5000 THEN
            DBMS_OUTPUT.PUT_LINE('낮음');
        WHEN v_salary <= 9000 THEN
            DBMS_OUTPUT.PUT_LINE('중간');
        ELSE
            DBMS_OUTPUT.PUT_LINE('높음');
    END CASE;
END;

-- 중첩 IF문
DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
    v_commission NUMBER := 0;
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 120), -1);
    
    SELECT salary, commission_pct
    INTO v_salary, v_commission
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE(v_salary);
    
    IF v_commission > 0 THEN
        IF v_commission > 0.15 THEN
            DBMS_OUTPUT.PUT_LINE(v_salary * v_commission);
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_salary);
    END IF;    
END;

-- WHILE 문
DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_num);
        v_count := v_count + 1;
    END LOOP;
END;
    
-- 탈출문
DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_num);
        EXIT WHEN v_count = 5;
        v_count := v_count + 1;
    END LOOP;
END;

-- FOR 문
DECLARE
    v_num NUMBER := 3;
BEGIN    
    FOR i IN 1..10 -- .을 두개 작성해서 범위를 표현
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_num || ' x ' || i || ' = ' || v_num * i);
    END LOOP;
END;

-- CONTINUE문
DECLARE
    v_num NUMBER := 3;
BEGIN    
    FOR i IN 1..10
    LOOP
        CONTINUE WHEN i = 5;
        DBMS_OUTPUT.PUT_LINE(v_num || ' x ' || i || ' = ' || v_num * i);
    END LOOP;
END;



-- 1. 모든 구구단을 출력하는 익명 블록 만들기 (2 ~ 9단)
BEGIN    
    FOR i IN 2..9
    LOOP
        DBMS_OUTPUT.PUT_LINE('구구단: ' || i || '단');
        FOR j in 1..9
        LOOP 
            DBMS_OUTPUT.PUT_LINE(i || ' x ' || j || ' = ' || i * j);
        END LOOP;
    DBMS_OUTPUT.PUT_LINE('----------------------');
    END LOOP;
END;

-- 2. INSERT를 300번 실행하는 익명 블록 처리하기
--    board라는 이름의 테이블을 만들기 (bno writer title 컬럼 존재)
--    bno는 SEQUENCE로 올리고 writer와 title에 번호를 붙여서 INSERT 진행
-- ex) 1, test1, title1 -> 2, test2, title2 -> 3, test3, title3 ...

CREATE TABLE board(
    bno NUMBER PRIMARY KEY,
    writer VARCHAR2(30),
    title VARCHAR2(30)
);

CREATE SEQUENCE b_seq 
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
    
DECLARE
    v_num NUMBER := 1;
BEGIN
    WHILE v_num <= 300
    LOOP
        INSERT INTO board
        VALUES (b_seq.NEXTVAL, 'test' || v_num, '제목제목' || v_num);
        v_num := v_num + 1;
    END LOOP;
    COMMIT;
END;

SELECT * FROM board
ORDER BY bno desc;
