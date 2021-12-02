#문제 1) 부서번호가 D001인 부서의 사원번호와 사원의 이름을 조회하기.
USE EMPLOYEES;

SELECT 
    E.EMP_NO, 
    E.FIRST_NAME, 
    E.LAST_NAME
FROM
    EMPLOYEES E
	INNER JOIN DEPT_EMP D 
    ON D.EMP_NO = E.EMP_NO
WHERE
    D.DEPT_NO = 'D001';

# 문제 2) 1960년 이후에 태어난 사원들이 근무하고 사원들의 사원번호, 근무부서 번호를 가져온다.
SELECT 
    E.EMP_NO, 
    D.DEPT_NO
FROM
    EMPLOYEES E
	INNER JOIN DEPT_EMP D 
    ON D.EMP_NO = E.EMP_NO
WHERE
    E.BIRTH_DATE >= '1960-01-01';
  

# 문제 3) 직급이 Senior Engineer인 사원의 이름을 조회하기.
SELECT 
    E.FIRST_NAME, 
    E.LAST_NAME
FROM
    EMPLOYEES E
    INNER JOIN TITLES T 
    ON T.EMP_NO = E.EMP_NO
WHERE
    T.TITLE = 'SENIOR ENGINEER';
  
    
# 문제 4) Development부서의 성별로 직원 수를 조회하기
-- SELECT 
--     E.GENDER, COUNT(*)
-- FROM
--     EMPLOYEES E
-- 	INNER JOIN DEPT_EMP D 
--     ON E.EMP_NO = D.EMP_NO
-- 	INNER JOIN DEPARTMENTS DE 
--     ON D.DEPT_NO = (SELECT DEPT_NO FROM DEPARTMENTS WHERE DEPT_NAME = 'Development')
-- GROUP BY
-- 	E.GENDER;

SELECT 
	GENDER, 
    COUNT(*)
FROM
	employees
WHERE
	EMP_NO IN(SELECT 
				EMP_NO 
			  FROM 
				DEPT_EMP 
              WHERE 
				DEPT_NO = (SELECT 
							DEPT_NO 
						   FROM 
							DEPARTMENTS 
						   WHERE 
							DEPT_NAME = 'Development'))
GROUP BY
	GENDER;