### SQL 활용
#### 표준 조인
- 일반집합연산자
  - UNION : 합집합을 제공하는 연산자
    ```sql
    -- UNION 연산
    SELECT 열 이름1
    FROM 테이블명1
    UNION
    SELECT 열 이름2
    FROM 테이블명2;
    -- UNION ALL 연산
    SELECT 열 이름1
    FROM 테이블명1
    UNION ALL
    SELECT 열 이름2
    FROM 테이블명2;
    ```
    - 교집합의 중복을 제거하는 연산을 수행해 정렬작업으로 인한 시스템에 부하가 발생할 수 있음
    - UNION ALL은 중복을 포함해 보여줌(정렬작업 X)
  - INTERSECTION : 교집합을 제공하는 연산자
    ```sql
    -- INTERSECT 연산
    SELECT 열 이름1
    FROM 테이블명1
    WHERE 조건절1
    INTERSECT
    SELECT 열 이름2
    FROM 테이블명2
    WHERE 조건절2;
    ```
  - DIFFERENCE(EXCEPT, MINUS)
    ```sql
    -- MINUS 연산
    SELECT 열 이름1
    FROM 테이블명1
    WHERE 조건절1
    MINUS
    SELECT 열 이름2
    FROM 테이블명2
    WHERE 조건절2;
    ```
    - 차집합을 제공하는 연산자로 첫 번째 집합에서 두 번째 집합의 공통 집합을 제외
    - 오라클에서는 MINUS로 SQL문 수행
  - PRODUCT(CROSS JOIN)
    - 곱집합을 제공하며, JOIN 조건이 없는 경우 생길 수 있는 모든 데이터 조합 연산자
    - 양쪽 집합의 M*N의 데이터 조합이 발생하며, CARTESIAN PRODUCT라고도 함
- 순수관계연산자
  - SELECT
    - 행들에 대한 부분집합으로, WHERE절 기능으로 구현
  - PROJECT
    - 열들에 대한 부분집합으로, SELECT절의 열 선택으로 구현
  - NATURAL JOIN
    - WHERE절에 조인 조건을 기재해 구현
    - NATURAL JOIN, INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN, USING 조건절, ON 조건절 등이 있음
  - DIVIDE 연산
    - 나눗셈과 비슷한 개념의 연산자로, SQL문으로는 없음
- 조인 형태
  - INNER JOIN : JOIN 조건에서 동일한 값이 있는 행만 반환
    ```sql
    -- INNER JOIN
    SELECT 열 이름
    FROM 테이블명1, 테이블명2
    WHERE 테이블명1 = 테이블명2;
    ```
  - NATURAL JOIN : 두 테이블 간 동일한 이름을 갖는 열들에 대해 INNER JOIN 수행
    ```sql
    -- NATURAL JOIN 실습
    SELECT 열 이름1,
        열 이름2
    FROM 테이블명1,
        테이블명2
    WHERE 테이블명1;
    NATURAL JOIN 테이블명2;
    -- NATURAL JOIN을 INNER JOIN으로 변환
    SELECT 열 이름1,
        열 이름2
    FROM 테이블명1,
        테이블명2
    WHERE 테이블명1 = 테이블명2;
    ```
  - USING 조건절 : 같은 이름을 가진 열들 중 원하는 열에 대한 선택적 INNER JOIN 수행
    ```sql
    -- USING절 실습
    SELECT 열 이름1,
            열 이름2
    FROM 테이블명1,
        JOIN 테이블명2 USING (열 이름);
    ```
  - ON 조건절 : JOIN 서술부와 비 JOIN 서술부를 분리해 이해가 쉽고 열 이름이 달라도 JOIN 조건을 사용할 수 있음
    ```sql
    -- ON절 실습
    SELECT 열 이름1,
        열 이름2
    FROM 테이블명1
        INNER JOIN 테이블명2 ON (조인 열 이름1 = 조인 열 이름2);
    ```
  - CROSS JOIN : 일반집합연산자의 PRODUCT 개념으로, 테이블 간 JOIN 조건이 없는 경우 생길 수 있는 모든 데이터의 조합
    ```sql
    -- CROSS JOIN - 조인 조건 없는 방식
    SELECT 열 이름1, 열 이름2
    FROM 테이블명1, 테이블명2;
    -- CROSS JOIN - ANSI 표준 방식
    SELECT 열 이름1, 열 이름2
    FROM 테이블명1
        CROSS JOIN 테이블명2;
    ```
  - OUTER JOIN : JOIN 조건에서 동일한 값이 없는 행도 결과 집합에 포함 시킬 때 사용
    ```sql
    -- LEFT OUTER JOIN - 오라클 DBMS 방식
    SELECT 열 이름1, 열 이름2
    FROM 테이블명1, 테이블명2
    WHERE 조인 열 이름1 = 조인 열 이름2(+);
    -- LEFT OUTER JOIN - ANSI 방식
    SELECT 열 이름1, 열 이름2
    FROM 테이블명1 LEFT OUTER JOIN 테이블명2 ON(조인 열 이름1 = 조인 열 이름2);
        -- LEFT OUTER JOIN - 오라클 DBMS 방식
    SELECT 열 이름1, 열 이름2
    FROM 테이블명1, 테이블명2
    WHERE 열 이름1(+) = 열 이름2;
    -- LEFT OUTER JOIN - ANSI 방식
    SELECT 열 이름1, 열 이름2
    FROM 테이블명1 RIGHT OUTER JOIN 테이블명2 ON(조인 열 이름1 = 조인 열 이름2);
    -- FULL OUTER JOIN - ANSI 방식
    SELECT 열 이름1, 열 이름2
    FROM 테이블명1 FULL OUTER JOIN 테이블명2 ON(조인 열 이름1 = 조인 열 이름2);
    ```

#### 계층형 질의와 셀프 조인
- 계층형 질의
![](../image/6-1.jpg)
  - 테이블 내 계층형 데이터가 존재하는 경우 데이터를 조회하기 위해 계층형 질의를 사용함
  - 계층형 데이터란 동일 테이블에 계층적으로 상위와 하위 데이터가 포함된 데이터를 말함
- 오라클 계층형 SQL
  - 오라클 DBMS에서 제공하는 기존 SELECT문에 START WITH, CONNECT BY, ORDER SIBLINGS BY문을 결합한 구조
  - 계층형 SQL문은 위의 6가지 결합된 형태로 이루어져 있으며, 계층형 SQL문에서는 오라클 내부에서 제공하는 Pseudo 가상 열이 있음
  - START WITH 조건 : 계층 구조 전개의 시작 위치를 지정하는 구문으로, 루트 데이터를 지정함
  - CONNECT BY [NOCYCLE] [PRIOR] A AND B
    - CONNECT BY절 : 다음에 전개될 자식 데이터를 지정하는 구문
    - PRIOR PK(자식) = FK(부모) 형태를 사용하면 계층 구조에서 자식 데이터에서 부모 데이터(부모 -> 자식) 방향으로 전개하는 순방향 전개를 함
    - PRIOR FK(부모) = PK(자식) 형태를 사용하면 반대로 자식 데이터에서 부모 데이터(자식 -> 부모)로 전개하는 역방향 전개를 함
    - NOCYCLE을 추가하면 사이클이 발생한 이후 데이터는 전개하지 않음
  - ORDER SIBLINGS BY 열 이름 : 형제 노드(동일 레벨) 사이에서 정렬을 수행
- 계층형 SQL문
  ```sql
  SELECT 열 이름1,
        CONNECT_BY_ISLEAF AS CBI
        SYS_CONNECT_BY_PATH(계층형의 경로)
  FROM 테이블명1, 테이블명2
  WHERE 조인 열 이름1 = 조인 열 이름2
  START WITH 열 이름 IS 시작행
  CONNECT BY PRIOR 자식 열 이름(PK) = 부모 열 이름(FK)
  ORDER SIBLINGS BY 열 이름;
  ```
- SELF JOIN을 활용한 계층형
  ```sql
  SELECT 열 이름
  FROM 테이블명1, 테이블명1
  WHERE 조인 열 이름1 = 조인 열 이름2;
  ```