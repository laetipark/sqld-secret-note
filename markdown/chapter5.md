### SQL
- 관계형 데이터베이스에 데이터 정의, 조작, 제어를 하기위해 사용하는 언어
- 특정 데이터들의 집합에서 필요한 데이터를 꺼내 조회, 새로운 데이터를 입력/수정/삭제하는 행위를 통해 데이터베이스와 대화

##### SQL문 종류
- 데이터 정의어(DDL, Data Definition Language)
  ```sql
  -- CREATE TABLE
  CREATE TABLE 테이블명 ();  
  ```
  ```sql
  -- ALTER ADD : TABLE 열 추가
  ALTER TABLE 테이블명 ADD (열 이름);
  -- ALTER DROP : TABLE 열 제거
  ALTER TABLE 테이블명 DROP COLUMN 열 이름;
  -- ALTER MODIFY : TABLE 열 수정
  ALTER TABLE 테이블명 MODIFY (
      열 이름 변경
  );
  -- ALTER RENAME : TABLE 열 이름 변경
  ALTER TABLE 테이블명
      RENAME 열 이름 TO 변경 열 이름;
  -- ALTER DROP CONSTRAINT : 외래키 제거
  ALTER TABLE 테이블명 DROP CONSTRAINT 외래키명;
  -- ALTER ADD CONSTRAINT : 외래키 생성
  ALTER TABLE 테이블명 ADD CONSTRAINT 외래키명 FOREIGN KEY (적용 열 이름) REFERENCES 테이블명(참고 열 이름);
  -- RENAME : 테이블명 변경
  RENAME 테이블명 TO 바꿀 테이블명;
  -- TRUNCATE : 테이블에 저장된 데이터 제거
  TRUNCATE TABLE 테이블명;
  -- DROP : 테이블 제거
  DROP TABLE 테이블명;
  ```
- 데이터 조작어(DML, Data Manipulation Language)
  ```sql
  -- SELECT문
  SELECT 열 이름1, 열 이름 2... FROM 테이블명;
  -- DISTINCT : SELECT 중복 행 제거
  SELECT DISTINCT 열 이름1, 열 이름 2... FROM 테이블명;
  -- SELECT * : FROM절 내 테이블 모든 열 출력
  SELECT * FROM 테이블명;
  -- ALIAS : 대체 이름 지정
  SELECT 열 이름1 AS 대체 열 이름 FROM 테이블명;
  -- || : 합성 연산자
  SELECT 열 이름1 || '-' || 열 이름2 || '(' || 열 이름3 || ')' AS "열 이름1-열 이름2(열 이름3)" FROM 테이블명;
  -- DUAL 테이블 : 단 1건의 데이터가 저장되어 있고 DUMMY열 1개 존재
  SELECT ((1 + 1) * 3) / 6 AS "연산결과 값" FROM DUAL;
  ```
- 데이터 제어어(DCL, Data Control Language)
- 트랜잭션 제어어(TCL, Transaction Control Language)
  ```sql
  -- COMMIT : 변경사 DB 최종 적용
  트랜잭션;
  COMMIT;
  -- ROLLBACK : 변경사항 취소
  트랜잭션;
  ROLLBACK;
  -- SAVEPOINT : 변경사항 저장
  SAVEPOINT SVPT1; -- SAVEPOINT 1
  트랜잭션1;
  SAVEPOINT SVPT2; -- SAVEPOINT 2
  트랜잭션2;
  ROLLBACK TO SVPT2; -- SAVEPOINT 1까지 변경사항으로 되돌림
  ```

##### 테이블
- 데이터를 저장하는 객체, 열과 행의 2차원 구조로 나타내는 RDB의 기본 단위
- 열 : 세로 방향 / 행 : 가로 방향 / 필드 : 열과 행이 겹치는 부분

##### ERD(Entity Relationship)
- 테이블 간 서로의 상관 관계를 그림으로 도식화한 것
- 구성요소 : 엔터티, 관계, 속성
- DDL : DB를 구성하고 있는 다양한 객체를 정의, 변경, 제거하는 데 사용
  - 대표적인 자료형
    - CHAR(L) : 고정길이 문자열, 길이가 L값보다 작을 경우 공백으로 채워짐
    - VARCHAR2(L) : 가변길이 문자, 길이 L값보다 작을 경우 입력한 값만큼만 공간 차지
    - NUMBER(L, D) : 정수 및 실수를 저장, L은 전체 자릿수, D값은 소수점 자릿수
    - DATE : 날짜와 시각정보 저장
  - 신규 테이블 생성 : CREATE TABLE 테이블명 (열 자료형 NULL 여부)
  - 제약조건 : 테이블에 입력되는 데이터가 사용자가 원하는 조건을 만족하는 데이터만 입력되는 것을 보장
    - 기본키 : 테이블의 행들 중에 특정 행을 고유하게 식별하기 위함, 유일 인덱스를 자동으로 생성하며, NOT NULL 제약조건을 만족
    - 고유키 : 기본키와 다른 점은 NULL 입력이 가능, UNIQUE 제약조건만 만족하는 것
    - NOT NULL : 해당 열에는 NULL 입력이 금지되었기 때문에 어떤 값이라도 들어와야함
    - CHECK : 입력할 수 있는 값의 종류 또는 범위 제한
    - 외래키 : 다른 테이블의 기본키를 외래키로 지정하는 경우 생성하며 참조 무결성 제약조건
    - 기본값, 디폴트값 : 해당 열이 아무런 값도 입력하지 않았을 때 지정한 디폴트 값으로 데이터 입력
    - CONSTRAINT로 제약조건 추가하거나 REFERENCES를 통해 외래키 생성
  - 테이블 변경 : ALTER TABLE 테이블명 (ADD/DROP/MODIFY) 열이름
  - 테이블 내부 열 제거 : TRUNCATE문 TABLE 테이블 열 (ROLLBACK문을 이용한 복구 불가능) / DROP TABLE 테이블 열
- DML : 데이터를 입력/수정/삭제/조회하는 역할
- TCL : 입력, 수정, 삭제 후 커밋 혹은 롤백하는 데 사용하는 SQL문
  - 트랜잭션 : DB의 논리적 연산 단위로 1개의 트랜잭션에 1개 이상 SQL문이 포함
    - 원자성(Atomicity) : 트랜잭션에서 정의된 연산들은 모두 성공적으로 끝나거나 모두 실패해야함(ALL OR NOTHING)
    - 일관성(Consistency) : 트랜잭션이 실행되기 전, 데이터베이스의 내용이 잘못되어 있지 않다면 실행된 이후에도 데이터베이스의 내용에 잘못이 있으면 안됨
    - 고립성(Isolation) : 트랜잭션이 실행되는 도중에 다른 트랜잭션이 영향을 받아 잘못된 결과를 만들어서는 안됨
    - 지속성(Durability) : 트랜잭션이 성공적으로 수행되면 그 트랜잭션이 갱신한 데이터베이스의 내용은 영구적으로 저장됨
    - 고립성(Isolation) : 트랜잭션이 실행되는 도중 다른 트랜잭션의 영향을 받아 잘못된 결과를 만들면 안됨
    - 지속성(Durability) : 트랜잭션이 성공적으로 수행되면 그 트랜잭션이 갱신한 데이터베이스의 내용은 영구적으로 저장
    - 트랜잭션의 목적 : 데이터 변경을 발생시키는 입력/수정/삭제 수행 시 변경되는 데이터의 무결성을 보장하는 것이 커밋과 롤백 목적
  - COMMIT : 입력/수정/삭제한 자료에 대해 문제가 없을 경우 COMMIT으로 트랜잭션 완료, 변경된 데이터를 테이블에 영구적으로 반영
    - COMMIT 명령 실행 시 수정 내용이 DB에 최종 적용
  - ROLLBACK : 커밋 실행 전 입력/수정/삭제한 변경사항을 취소할 수 있음. 변경 전으로 복구
    - ROLLBACK 명령 실행 시 수정 전 내용이 DB에 적용
  - SAVEPOINT : 여러 입력/수정/삭제가 있는 하나의 트랜잭션에 변경 지점을 저장, 데이터 변경 사항 취소를 지정한 지점까지만 취소하는 것
    - SAVEPOINT 'SAVEPOINT 이름'으로 SAVEPOINT 지점 지정, ROLLBACK TO 'SAVEPOINT 이름'할 시 해당 부분까지만 ROLLBACK

##### WHERE
- 비교 연산자
  - = : ~와 같
  - > : ~보다 큼
  - >= : ~보다 크거나 같음
  - < : ~보다 작다
  - <= : ~보다 작거나 같음
- SQL 연산자
  - BETWEEN A AND B : A와 B사이
  - IN (LIST) : 리스트에 있는 값 중 하나라도 있으면 됨
  - LIKE '비교 문자열' : 비교 문자열과 형태가 일치하면 됨
    - 와일드카드
      - % : 0개 이상의 어떤 문자
      - _ : 1개의 단일 문자
  - IS (NOT) NULL : 값이 NULL(이 아님)
- 논리 연산자
  - AND / OR / NOT
- 부정 비교 연산자
  - NOT BETWEEN A AND B : A와 B의 값 사이에 있지 않음
  - NOT IN (LIST) : 같지 않음
  - IS NOT NULL : NULL 값이 아님
- CHAR VS VARCHAR2
  - CHAR : 고정 길이 문자열, 자릿수가 부족할 경우나 끝에 공백을 작성할 경우 끝에 공백도 같이 저장
    - 양쪽이 모두 CHAR 타입일 경우 데이터 비교
      - CHAR 길이가 서로 다르면 작은 쪽에 공백을 추가해 길이를 같게 함
      - 서로 다른 문자가 나올 떄까지 비교
      - 달라진 첫 번째 값에 따라 크기 결정
      - 공백의 수만 다르면 값은 값으로 결정
  - VARCHAR2 : 가변 길이 문자열
    - 한 쪽이 VARCHAR2인 경우
      - 서로 다른 문자가 나올 때까지 비교
      - 길이가 다르다면 짧은 것이 끝날 떄까지만 비교한 후 길이가 긴 것이 크다고 판단
      - 길이가 같고 다른 것이 없다면 같다고 판단
      - VARCHAR2는 공백도 문자로 판단
  - ROWNUM : 특정 테이블에서 데이터가 조회될 때 출력되는 행의 순번을 의미하는 Pseudo 열의 예약어
    - 결과 행의 건수를 제한할 수 있음

##### 단일행 함수
- SELECT, WHERE, ORDER BY 절에 사용 가능
- 각 행들에 대해 개별적으로 작용하여 데이터 값들을 조작하고, 각각의 행에 대한 조작 결과를 리턴
- 여러 인자를 입력해도 단 하나의 결과만 리턴
- 함수 인자로 상수, 변수, 표현식으로 사용 가능하고, 하나의 인수를 가지는 경우도 있지만 여러 개의 인수를 가질 수 있음
- 함수 인자로 함수 호출 자체를 사용하는 함수의 중첩도 가능
- 문자형 함수 : 문자를 입력하면 문자나 숫자값을 반환
  - LOWER, UPPER, SUBSTR, LENGTH, LTRIM, RTRIM, TRIM, ASCII
- 숫자형 함수 : 숫자를 입력하면 숫자 값을 반환
  - ABS, MOD, ROUND, TRUNC, SIGN, CHR, CEIL, FLOOR, EXP, LOG, LN, POWER, SIN, COS, TAN
- 날짜형 함수 : DATE 타입의 값을 연산 
  - SYSDATE, EXTRACT, TO_NUMBER
- 변환형 함수 : 문자, 숫자, 날짜형 데이터를 다른 데이터형으로 형변환
  - 명시적 형 변환 : 데이터 형변환 함수로 데이터형을 변환하도록 명시
  - 암시적 형 변환 : DBMS가 자동으로 데이터형을 변환
  - TO_NUMBER, TO_CHAR, TO_DATE, CONVERT 
- NULL 관련 함수 : NULL을 처리하기 위한 함수
  - NVL, NULLIF, COALESCE
      ```sql
      -- NVL : 값이 NULL인 경우 지정값을 출력, 아니면 원래 값을 그대로 출력
      SELECT NVL(값, 대체값) FROM 테이블명
      ```
- CASE 표현 : 함수 내 조건문
  - CASE WHEN 조건 THEN (값 혹은 SQL문) ELSE (값 혹은 SQL문) END
  - DECODE(조건1, 값1, 조건2, 값2, 디폴트 값)

##### GROUP BY, HAVING절
- 집계 함수 : 각각의 그룹별로 단 하나의 행을 리턴해주는 함수
  - GROUP BY절에 기재한 열을 기준으로 각 그룹의 집계를 계산
  - SELECT전, HAVING절, ORDER BY절에 사용할 수 있음
  - ALL : DEFAULT 옵션으로 생략 가능
  - DISTINCT : 유일한 값을 출력
  - COUNT(*) : NULL 값을 포함한 행의 수 출력
  - COUNT(표현식) : 표현식의 값이 NULL이 아닌 행의 수 출력
  - SUM(표현식) : 표현식이 NULL인 값인 것을 제외한 합계
  - AVG(표현식) : 표현식이 NULL인 값인 것을 제외한 평균
  - MAX(표현식) : 표현식이 NULL인 값인 것을 제외한 최댓값
  - MIN(표현식) : 표현식이 NULL인 값인 것을 제외한 최솟값
  - STDDEV(표현식) : 표현식이 NULL인 값인 것을 제외한 표준편차
  - VARIAN(표현식) : 표현식이 NULL인 값인 것을 제외한 분산
- GROUP BY절
  - GROUP BY절을 통해 소그룹별 기준 열을 정한 후, SELECT절에서는 집계 함수를 사용
  - 집계 함수의 결과는 NULL 값을 가진 행을 제외하고 수행
  - GROUP BY절에는 SELECT절과는 달리 ALIAS명을 사용할 수 없음
  - GROUP BY절보다 전체 데이터를 GROUP으로 나누기 전 행들을 필터 처리하기 때문에 집계 함수는 WHERE절에 올 수 없음
- HAVING절
  - WHERE절에는 집계 함수를 쓸 수 없기 때문에 집계된 결과집합을 기준으로 조건을 주고 싶은 경우, HAVING절을 이용
  - WHERE절과 다른 점은 그룹을 나타내는 결과집합의 행에 조건이 적용된다는 점에서 차이가 있음
  - HAVING절에 들어가는 조건은 GROUP BY절의 기준 항목이나 소그룹의 집계 함수가 사용됨
  - GROUP BY절에 의한 소그룹별로 만들어진 집계 데이터 중, HAVING절에 제한 조건을 두어 조건을 만족하는 내용만 출력
  - HAVING절은 일반적으로 GROUP BY절 뒤에 위치
  - HAVING절이 GROUP BY절 앞에 나와도 결과는 동일
- ORDER BY절
  - ORDER BY절은 SQL문장으로 조회된 데이터(Rows)를 다양한 목적에 맞게, 특정 열을 기준으로 정렬하여 출력하는 데 사용
  - ORDER BY절에 열명 대신 SELECT절에서 사용한 ALIAS명이나 칼럼 순서를 나타내는 상수도 사용 가능
  - ORDER BY절에 기재한 칼럼 뒤에 정렬 방식을 기재할 수 있으며, 오름차순(ASC), 내림차순(DESC)이 있음(기본 ASC)
  - 숫자형 데이터형은 오름차순으로 정렬했을 경우, 가장 작은 값부터 출력, 날짜형 데이터형은 오름차순으로 정렬했을 경우 가장 빠른 값이 먼저 출력
  - 오라클 DBMS 기준 NULL값을 가장 큰 값으로 간주해 오름차순으로 정렬했을 경우 가장 마지막에, 내림차순의 경우 가장 먼저 위치