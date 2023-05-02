-- 부모 테이블 생성
CREATE TABLE TB_SUBWAY_STATN_TMP (
    SUBWAY_STATN_NO CHAR(6) NOT NULL,
    LN_NM VARCHAR2(50) NOT NULL,
    STATN_NM VARCHAR2(50) NOT NULL,
    -- SUBWAY_STATN_NO를 PK로 지정
    CONSTRAINT PK_TB_SUBWAY_STATN_TMP PRIMARY KEY(SUBWAY_STATN_NO)
);
-- 자식 테이블 생성
CREATE TABLE TB_SUBWAY_STATN_TK_GFF_TMP (
    SUBWAY_STATN_NO CHAR(6) NOT NULL,
    STD_YM CHAR(6) NOT NULL,
    BEGIN_TIME CHAR(4) NOT NULL,
    END_TIME CHAR(4) NOT NULL,
    TK_GFF_SE_CD VARCHAR2(6) NOT NULL,
    TK_GFF_CNT NUMBER(15) NOT NULL,
    CONSTRAINT PK_TB_SUBWAY_STATN_TMP PRIMARY KEY(
        SUBWAY_STATN_NO,
        STD_YM,
        BEGIN_TIME,
        END_TIME,
        TK_GFF_SE_CD
    )
);
-- 외래키 생성
-- TB_SUBWAY_STATN_TK_GFF_TMP에서의 SUBWAY_STATN_NO 열은
-- TB_SUBWAY_STATN_TMP의 SUBWAY_STATN_NO를 참조
ALTER TABLE TB_SUBWAY_STATN_TK_GFF_TMP
ADD CONSTRAINT FK_TB_SUBWAY_STATN_TK_GFF_TMP1 FOREIGN KEY (SUBWAY_STATN_NO) REFERENCES TB_SUBWAY_STATN_TMP(SUBWAY_STATN_NO);