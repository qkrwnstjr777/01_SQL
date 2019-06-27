-- 청해진 대학 IT 과정 중간 테스트 1차 : SQL
/*
전공 : 컴퓨터 공학과                   
이름 : 박준석
학년 : 2016244089
*/

-- emp테이블에서
--1.	모든 직원의 사번, 이름, 직무, 급여를 조회하시오. 

SELECT *
FROM EMP 
;

/*
EMPNO, ENAME,    JOB,        MGR,   HIREDATE,   SAL, COMM, DEPTNO
-------------------------------------------------------------------
7369	SMITH	CLERK	    7902	80/12/17	800		    20
7499	ALLEN	SALESMAN	7698	81/02/20	1600  300	30
7521	WARD	SALESMAN	7698	81/02/22	1250  500	30
7566	JONES	MANAGER	    7839	81/04/02	2975		20
7654	MARTIN	SALESMAN	7698	81/09/28	1250  1400	30
7698	BLAKE	MANAGER	    7839	81/05/01	2850		30
7782	CLARK	MANAGER	    7839	81/06/09	2450		10
7839	KING	PRESIDENT		    81/11/17	5000		10
7844	TURNER	SALESMAN	7698	81/09/08	1500    0	30
7900	JAMES	CLERK	    7698	81/12/03	950		    30
7902	FORD	ANALYST	    7566	81/12/03	3000		20
7934	MILLER	CLERK	    7782	82/01/23	1300		10
9999	J_JAMES	CLERK					
8888	J%JAMES	CLERK					
*/

--2.	매니저가 있는 직원의 사번, 이름, 매니저 사번을 조회하시오.

SELECT e.empno
        ,e.ename
        ,e.MGR
FROM emp e
WHERE e.job = 'MANAGER'
;
/*
EMPNO,  ENAME,   MGR
---------------------
7566	JONES	7839
7698	BLAKE	7839
7782	CLARK	7839
*/

--3.	모든 직원에 대하여, 사번, 이름, 급여, 연 급여를 조회하시오.

SELECT  e.empno
        ,e.ename
        ,e.sal
        ,e.sal * 12  "연 급여"
FROM emp e
;
/*
EMPNO, ENAME,   SAL,    연 급여
------------------------------
7369	SMITH	800	    9600
7499	ALLEN	1600	19200
7521	WARD	1250	15000
7566	JONES	2975	35700
7654	MARTIN	1250	15000
7698	BLAKE	2850	34200
7782	CLARK	2450	29400
7839	KING	5000	60000
7844	TURNER	1500	18000
7900	JAMES	950	    11400
7902	FORD	3000	36000
7934	MILLER	1300	15600
9999	J_JAMES		
8888	J%JAMES		
*/
        
--4.	30번 부서 소속인 직원의 사번, 이름, 부서번호를 조회하시오.
SELECT   e.empno
        ,e.ename
        ,e.deptno
FROM emp e
WHERE e.deptno = 30
;
/*
EMPNO, ENAME, DEPTNO
---------------------
7499	ALLEN	30
7521	WARD	30
7654	MARTIN	30
7698	BLAKE	30
7844	TURNER	30
7900	JAMES	30
*/


--5.	급여가 2000 ~ 4000 사이인 직원의 사번, 이름, 급여를 조회하시오.

SELECT    e.empno
          ,e.ename
          ,e.sal
          
FROM emp e
WHERE e.sal > 2000 AND e.sal <4000
;
/*
EMPNO, ENAME,   SAL
----------------------
7566	JONES	2975
7698	BLAKE	2850
7782	CLARK	2450
7902	FORD	3000
*/

--6.	수당을 받는 직원의 사번, 이름, 수당을 조회하시오.

SELECT  e.empno
        ,e.ename
        ,e.comm
FROM emp e
WHERE comm >=0 
;
/*
EMPNO, ENAME, COMM
---------------------
7499	ALLEN	300
7521	WARD	500
7654	MARTIN	1400
7844	TURNER	0
*/


--7.	전직원의 급여가 10% 인상된 상황을 가정하고, 
--      현재 급여로부터 10% 인상된 급여를 구하여 
--      사번, 이름, 원급여, 총인상급여 네 가지를 조회하시오.

SELECT   e.empno
        ,e.ename 
        ,e.sal
        ,e.sal * 1.1 "총 인상급여" 
FROM emp e
;
/*
EMPNO, ENAME, SAL, 총 인상급여
------------------------------
7369	SMITH	800	    880
7499	ALLEN	1600	1760
7521	WARD	1250	1375
7566	JONES	2975	3272.5
7654	MARTIN	1250	1375
7698	BLAKE	2850	3135
7782	CLARK	2450	2695
7839	KING	5000	5500
7844	TURNER	1500	1650
7900	JAMES	950	    1045
7902	FORD	3000	3300
7934	MILLER	1300	1430
9999	J_JAMES		
8888	J%JAMES		
*/


--8.	10번 부서 소속인 직원에 대하여 급여가 15% 인상된 상황을 가정하고, 
--      현재 급여로부터 15%인상된 급여를 구하여 
--      사번, 이름, 원급여, 인상분, 총인상급여, 부서번호 를 조회하시오.


--9.	모든 직원에 대하여 원급여는 2500 이하이고
--      15% 인상된 급여는 2800이 넘는 직원의 
--      사번, 이름, 원급여, 총인상급여, 부서번호를 조회하시오.



--10.	이름에 E가 들어가는 직원의 사번, 이름을 조회하시오.



--dept 테이블에서
--1.	BOSTON 에 위치한 부서의 모든 정보를 조회하시오.
SELECT *
FROM dept
WHERE LOC = 'BOSTON'
;
/*
DEPTNO, DNAME,   LOC
-----------------------
40	OPERATIONS	BOSTON
*/

--2.	DALLAS, NEW YORK 에 위치한 부서의 모든 정보를 조회하시오.







