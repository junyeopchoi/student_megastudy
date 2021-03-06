# 문제 1) 한번에 주문 수량이 10개 이상인 상품 정보 테이블의 컬럼 모두 조회하기.
USE TEST_DB;

SELECT 
	*
FROM 
	T_PRODUCT 
WHERE 
	PRODUCT_CODE IN(SELECT 
						PRODUCT_CODE 
					FROM 
						T_ORDER 
					WHERE 
						ORDER_GOODS_QTY >= 10);


# 문제 2) 한번에 제일 많은 수량을 주문한 주문 코드 조회하기.
SELECT 
    ORDER_CODE
FROM
    T_ORDER
ORDER BY ORDER_GOODS_QTY DESC
LIMIT 1;


# 문제 3) 한번에 제일 많은 수량을 주문한 상품명 조회하기.
SELECT 
    P.PRODUCT_NAME
FROM
    T_ORDER T
INNER JOIN T_PRODUCT P
ON T.PRODUCT_CODE = P.PRODUCT_CODE
ORDER BY T.ORDER_GOODS_QTY DESC
LIMIT 1;
        
        
# 문제 4) 한번에 제일 많은 수량을 주문한 유저의 모든 정보 조회하기.
SELECT 
	M.*
FROM
    T_ORDER O
INNER JOIN T_MEMBER M
ON O.MEMBER_ID = M.MEMBER_ID
ORDER BY O.ORDER_GOODS_QTY DESC
LIMIT 1;
                                
                                
# 문제 5) 배송이 완료된 상품의 회원테이블의 모든 정보 조회하기.
SELECT
	M.*
FROM
	T_ORDER O
INNER JOIN T_MEMBER M
ON M.MEMBER_ID = O.MEMBER_ID
WHERE
	O.DELIVERY_STATE = '배송완료';
    
SELECT
	*
FROM
	T_MEMBER
WHERE
	MEMBER_ID IN(SELECT MEMBER_ID FROM T_ORDER WHERE DELIVERY_STATE = '배송완료');


# 문제 6) 배송이 완료되지 않은 상품의 상품명 조회하기.
-- SELECT
-- 	P.PRODUCT_NAME
-- FROM
-- 	T_ORDER O
-- INNER JOIN T_PRODUCT P
-- ON P.PRODUCT_CODE = O.PRODUCT_CODE
-- WHERE
-- 	O.DELIVERY_STATE != '배송완료';
SELECT
	PRODUCT_NAME
FROM
	T_PRODUCT
WHERE
	PRODUCT_CODE IN(SELECT PRODUCT_CODE FROM T_ORDER WHERE DELIVERY_STATE <> '배송완료');


# 문제 7) '메르켈' 회원이 주문한 상품 코드와 주문상품 명을 조회하기.
SELECT
	O.PRODUCT_CODE,
    P.PRODUCT_NAME
FROM
	T_ORDER O
INNER JOIN T_PRODUCT P
ON P.PRODUCT_CODE = O.PRODUCT_CODE
WHERE
	MEMBER_ID = (SELECT MEMBER_ID FROM T_MEMBER WHERE MEMBER_NAME = '메르켈');


# 문제 8) '메르켈' 회원의 총 주문수량을 조회하기.
SELECT
	COUNT(*)
FROM
	T_ORDER
WHERE
	MEMBER_ID = (SELECT MEMBER_ID FROM T_MEMBER WHERE MEMBER_NAME = '메르켈');
  
    
# 문제 9) 서울지역의 모든 제품의 판매수량의 총합을 조회하기.
SELECT
	SUM(ORDER_GOODS_QTY)
FROM
	T_ORDER
WHERE
	MEMBER_ID IN(SELECT MEMBER_ID FROM T_MEMBER WHERE REGIDENCE = '서울');


# 문제 10) 삼성전자 2021 노트북 플러스2 15.6이 판매된 지역을 조회하기.
SELECT
	REGIDENCE
FROM
	T_MEMBER
WHERE
	MEMBER_ID IN(SELECT MEMBER_ID FROM T_ORDER WHERE PRODUCT_CODE = (SELECT PRODUCT_CODE FROM T_PRODUCT WHERE PRODUCT_NAME = '삼성전자 2021 노트북 플러스2 15.6'));


# 문제 11) 2020년 동안 판매된 상품의 양이 5개 미만인 상품 이름 조회하기.
SELECT
	PRODUCT_NAME
FROM
	T_PRODUCT
WHERE
	PRODUCT_CODE IN(SELECT PRODUCT_CODE FROM T_ORDER WHERE ORDER_GOODS_QTY < 5);


# 문제 12) user4가 주문한 주문보다 주문을 많이 한 회원의 아이디와 주문개수를 조회하기.
SELECT
	MEMBER_ID,
    SUM(ORDER_GOODS_QTY) TOTAL
FROM
	T_ORDER
GROUP BY
	MEMBER_ID
HAVING
	TOTAL > (SELECT SUM(ORDER_GOODS_QTY) FROM T_ORDER WHERE MEMBER_ID = 'USER4');
