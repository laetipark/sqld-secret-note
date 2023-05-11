-- ON절 실습
SELECT A.SUBWAY_STATN_NO,
    A.LN_NM,
    A.STATN_NM,
    B.BEGIN_TIME,
    B.END_TIME,
    CASE
        WHEN B.TK_GFF_SE_CD = 'TGS001' THEN '승차'
        WHEN B.TK_GFF_SE_CD = 'TGS002' THEN '하차'
    END TK_GFF_SE_NM,
    B.TK_GFF_CNT
FROM TB_SUBWAY_STATN A
    INNER JOIN TB_SUBWAY_STATN_TK_GFF B ON (A.SUBWAY_STATN_NO = B.SUBWAY_STATN_NO)
WHERE A.SUBWAY_STATN_NO = '000001'
    AND B.STD_YM = '202010'
    AND B.BEGIN_TIME = '0000'
    AND B.END_TIME = '0900'
ORDER BY B.TK_GFF_CNT DESC;