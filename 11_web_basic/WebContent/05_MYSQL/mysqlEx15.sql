/*

	# 서브 쿼리

	
    - 서브 쿼리(Subquery)란 하나의 SQL문 안에 포함되어 있는 또 다른 SQL문을 의미한다.
   
    - 서브쿼리는 메인쿼리가 서브쿼리를 포함하는 종속적인 관계이다.
   
    - 서브쿼리는 메인쿼리의 컬럼을 모두 사용할 수 있지만 메인쿼리는 서브쿼리의 컬럼을 사용할 수 없다.
    
    - 서브쿼리는 알려지지 않은 기준을 이용한 검색을 위해 사용한다.
    
    - 조인쿼리와 서브쿼리 방식을 상황에 맞게 사용하는 것이 중요하다.

    - 서브쿼리 사용시 주의사항
		1) 서브쿼리를 ()괄호로 감싸서 사용한다.
		2) 서브쿼리는 단일 행 또는 복수 행 비교 연산자와 함께 사용 가능하다.
		3) 서브쿼리에서는 ORDER BY 를 사용하지 못한다.
    
    - 위치에 따라 사용되는 서브쿼리 예시
		1. SELECT 절     SELECT 절 안에 들어있다. 스칼라서브쿼리 (Scalar subqueries) 라고도 불린다.
		2. FROM 절		 FROM 절 안에 들어있다. 인라인뷰 (inline views) 라고 불린다.
		3. WHERE 절      WHERE 절 안에 들어있다. 중첩서브쿼리 (nested subqueries) 라고도 불린다
		4. HAVING 절
		5. ORDER BY 절
		6. INSERT 문의 VALUES 절
		7. UPDATE 문의 SET 절

*/


# 예시 1) '신한은행'의 세금을 조회하기.
SELECT 
    TAX
FROM
    T_TAX
WHERE
    BANK_CD = (SELECT 
            BANK_CD
        FROM
            T_BANK
        WHERE
            BANK_NM = '신한은행');


# 예시 2) '신한은행'이 아닌 은행들의 세금의 총합을 조회하기.
SELECT 
    SUM(TAX)
FROM
    T_TAX
WHERE
    BANK_CD != (SELECT 
            BANK_CD
        FROM
            T_BANK
        WHERE
            BANK_NM = '신한은행');



# 예시 3) 은행코드 'kb'의 세금에서 모든 은행의 세금의 평균을 뺀 값을 조회하기.
SELECT
	TAX-(SELECT AVG(TAX) FROM T_TAX)
FROM 
	T_TAX
WHERE BANK_CD = 'KB';


# 예시 4)'국민은행'의 세금에서 모든 은행의 세금의 평균을 뺀 값을 조회하기.
SELECT
	TAX-(SELECT AVG(TAX) FROM T_TAX)
FROM 
	T_TAX
WHERE BANK_CD = (SELECT BANK_CD FROM T_BANK WHERE BANK_NM = '국민은행');

		
# 예시 5) 모든 은행의 세금의 평균금액보다 큰 '은행코드' 조회하기.
SELECT
	BANK_CD
FROM
	T_TAX
WHERE TAX >= (SELECT AVG(TAX) FROM T_TAX);
                 
                        
# 예시 6) 모든 은행의 세금의 평균금액보다 큰 '은행명' 조회하기.
SELECT
	BANK_NM
FROM
	T_BANK
WHERE BANK_CD IN(SELECT
					BANK_CD
				FROM
					T_TAX
				WHERE TAX >= (SELECT
									AVG(TAX)
								FROM
									T_TAX));

							
# 예시 7) INSERT 구문아래의 서브쿼리 예시
CREATE TABLE MIGRATION_T_BANK(
	BANK_CD varchar(10),
    BANK_NM VARCHAR(10)
);

INSERT INTO MIGRATION_T_BANK (SELECT * FROM T_BANK);

SELECT * FROM MIGRATION_T_BANK;