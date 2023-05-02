-- ALTER ADD : TABLE 열 추가
ALTER TABLE PK_TB_SUBWAY_STATN_TMP
ADD (OPER_YN CHAR(1));
-- ALTER DROP : TABLE 열 제거
ALTER TABLE TB_SUBWAY_STATN_TMP DROP COLUMN OPER_YN;
-- ALTER MODIFY : TABLE 열 수정
ALTER TABLE TB_SUBWAY_STATN_TMP
MODIFY (
        OPER_YN NUMBER(1) DEFAULT 0 NOT NULL NOVALIDATE
    );
-- ALTER RENAME : TABLE 열 이름 변경
ALTER TABLE TB_SUBWAY_STATN_TMP
    RENAME COLUMN OPER_YN TO OPERATION_YN;
-- ALTER DROP CONSTRAINT : 외래키 제거
ALTER TABLE TB_SUBWAY_STATN_TK_GFF_TMP DROP CONSTRAINT FK_TB_SUBWAY_STATN_TK_GFF_TMP1;
-- ALTER ADD CONSTRAINT : 외래키 생성
ALTER TABLE TB_SUBWAY_STATN_TK_GFF_TMP
ADD CONSTRAINT FK_TB_SUBWAY_STATN_TK_GFF_TMP1 FOREIGN KEY (SUBWAY_STATN_NO) REFERENCES TB_SUBWAY_STATN_TMP(SUBWAY_STATN_NO);
-- RENAME : 테이블명 변경
RENAME TB_SUBWAY_STATN_TK_GFF_TMP TO TB_SUBWAY_STATN_TK_GFF_TMP_2;
-- TRUNCATE : 테이블에 저장된 데이터 제거
TRUNCATE TABLE TB_SUBWAY_STATN_TK_GFF_TMP_2;
-- DROP : 테이블 제거
DROP TABLE TB_SUBWAY_STATN_TK_GFF_TMP_2;
DROP TABLE TB_SUBWAY_STATN_TMP;
DROP TABLE TB_RN_TMP;