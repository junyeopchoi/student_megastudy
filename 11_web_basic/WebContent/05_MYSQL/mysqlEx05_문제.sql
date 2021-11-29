# 문제 1) 부서 관리자 정보 전부 조회하기.
SELECT * FROM dept_manager;

# 문제 2) 사원들 직함 정보를 모두 조회하기.
SELECT * FROM TITLES;
 
# 문제 3) 사원의 사원번호 , 생년월일 , 성별 조회하기.
SELECT EMP_NO, BIRTH_DATE, GENDER FROM EMPLOYEES;
 
# 문제 4) 부서의 부서번호 , 부서 이름 조회하기.
SELECT * FROM DEPARTMENTS;
 
# 문제 5) 각 사원의 사원번호 , 급여액 조회하기.
SELECT EMP_NO, SALARY FROM salaries;

# 문제 6) 각 사원의 사원번호 , 직함 이름을 조회하기.
SELECT EMP_NO, FIRST_NAME, LAST_NAME FROM employees;

# 문제 7) 각사원의 급여와 10 % 인상된 금액 조회하기.
SELECT SALARY, SALARY+(SALARY*0.1) FROM salaries;
	
# 문제 8) 각사원의 급여와 10 % 인하된 금액 조회하기.
SELECT SALARY, SALARY-(SALARY*0.1) FROM salaries;

# 문제 9) dept_emp 테이블에서 부서번호를 중복없이 조회하기.
SELECT DISTINCT DEPT_NO FROM dept_emp;

 
 
