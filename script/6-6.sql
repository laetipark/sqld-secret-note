-- LEFT OUTER JOIN - 오라클 DBMS 방식
SELECT NVL(A.DEPT_CD, '(Null)') AS A_DEPT_CD,
    NVL(A.DEPT_NM, '(Null)') AS A_DEPT_NM,
    NVL(B.EMP_NO, '(Null)') AS B_EMP_NO,
    NVL(B.EMP_NM, '(Null)') AS B_EMP_NM,
    NVL(B.DEPT_CD, '(Null)') AS B_DEPT_NO
FROM TB_DEPT_6_1_10 A,
    TB_EMP_6_1_10 B
WHERE A.DEPT_CD = B.DEPT_CD(+)
ORDER BY A.DEPT_CD;
-- LEFT OUTER JOIN - ANSI 방식
SELECT NVL(A.DEPT_CD, '(Null)') AS A_DEPT_CD,
    NVL(A.DEPT_NM, '(Null)') AS A_DEPT_NM,
    NVL(B.EMP_NO, '(Null)') AS B_EMP_NO,
    NVL(B.EMP_NM, '(Null)') AS B_EMP_NM,
    NVL(B.DEPT_CD, '(Null)') AS B_DEPT_NO
FROM TB_DEPT_6_1_10 A
    LEFT OUTER JOIN TB_EMP_6_1_10 B ON (A.DEPT_CD = B.DEPT_CD)
ORDER BY A.DEPT_CD;
-- RIGHT OUTER JOIN - 오라클 DBMS 방식
SELECT NVL(A.DEPT_CD, '(Null)') AS A_DEPT_CD,
    NVL(A.DEPT_NM, '(Null)') AS A_DEPT_NM,
    NVL(B.EMP_NO, '(Null)') AS B_EMP_NO,
    NVL(B.EMP_NM, '(Null)') AS B_EMP_NM,
    NVL(B.DEPT_CD, '(Null)') AS B_DEPT_NO
FROM TB_DEPT_6_1_10 A,
    TB_EMP_6_1_10 B
WHERE A.DEPT_CD(+) = B.DEPT_CD
ORDER BY A.DEPT_CD;
-- RIGHT OUTER JOIN - ANSI 방식
SELECT NVL(A.DEPT_CD, '(Null)') AS A_DEPT_CD,
    NVL(A.DEPT_NM, '(Null)') AS A_DEPT_NM,
    NVL(B.EMP_NO, '(Null)') AS B_EMP_NO,
    NVL(B.EMP_NM, '(Null)') AS B_EMP_NM,
    NVL(B.DEPT_CD, '(Null)') AS B_DEPT_CD
FROM TB_DEPT_6_1_10 A
    LEFT OUTER JOIN TB_EMP_6_1_10 B ON (A.DEPT_CD = B.DEPT_CD)
ORDER BY A.DEPT_CD;
-- FULL OUTER JOIN
SELECT NVL(A.DEPT_CD, '(Null)') AS A_DEPT_CD,
    NVL(A.DEPT_NM, '(Null)') AS A_DEPT_NM,
    NVL(B.EMP_NO, '(Null)') AS B_EMP_NO,
    NVL(B.EMP_NM, '(Null)') AS B_EMP_NM,
    NVL(B.DEPT_CD, '(Null)') AS B_DEPT_CD
FROM TB_DEPT_6_1_10 A
    LEFT OUTER JOIN TB_EMP_6_1_10 B ON (A.DEPT_CD = B.DEPT_CD);