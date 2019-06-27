-- day09 : 
-- 2. 복수행 함수 (그룹함수)

--1) COUNT(*): FROM 절에 나열된
--              특정 테이블의 행의 개수(데이터의 개수) 를 세어주는 함수
--              NULL 값을 처리하는 "유일"한 그룹함수


-- COUNT(expr) : expr 으로 등장한 값을 null 제외하고 세어주는 함수 

-- 문제 ) dept, salgrage 테이블의 전체 데이터 개수 조회
-- 1. dept 테이블 조회
SELECT d.*

FROM dept d
;

/*
DEPTNO, DNAME,   LOC
------------------------
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES   	CHICAGO
40	OPERATIONS	BOSTON
*/

-- 2. dept 테이블의 데이터 개수 조회 : COUNT(*) 사용
SELECT COUNT(*) AS "부서 개수"
FROM dept d
;

/*
부서 개수
------
    4
*/

SELECT d.*
FROM dept d
;

-- salgrade (급여등급) 테이블의 급여 등급 개수를 조회
SELECT COUNT(*) " 급여 등급 개수 " 
FROM salgrade 
;
-- 급여등급 개수
--          5

SELECT s.*
FROM salgrade s
;

/*
GRADE, LOSAL, HISAL
--------------------
1	700	    1200       
2	1201	1400
3	1401	2000       === COUNT(*)   ==== > 5
4	2001	3000
5	3001	9999
*/

-- COUNT(expr) 이 null 데이터를 처리하지 못하는 것 확인을 위한 데이터 추가
INSERT INTO "SCOTT"."EMP" (EMPNO, ENAME) VALUES ('7777', 'JJ');
COMMIT; 

-- emp 테이블에서 job 컬럼의 데이터 개수를 카운트 

SELECT   COUNT(e. job) "직무가 배정된 직원의 수"
FROM emp e
;
-- 직무가 배정된 직원의 수
-- 14

-- 문제) 회사에 매니저가 배정된 직원이 몇명인가
--  별칭 : 상사가 있는 직원의 수 

SELECT  COUNT(e.mgr) "상사가 있는 직원의 수"
FROM emp e
;
--상사가있는 직원의 수
--11

--  문제) 매니저 직을 맡고 있는 직원이 몇명인가?
--   1. emp테이블의 mgr 컬럼의 데이터 형태를 파악
--   2. mgr 컬럼의 중복 데이터를 제거
--   3. 중복 데이터가 제거된 결과를 카운트

SELECT DISTINCT e.mgr     -- e.mgr의 중복을 제거 
FROM emp e
;

/*
MGR
----
7782
7698
7902
7566
NULL
7839
*/

-- 3. 중복 데이터가 제거된 결과를  카운트

SELECT  COUNT (DISTINCT e.mgr) "매니저 수"
FROM emp e 
;
-- 매니저 수
--       5

-- 문제) 부서가 배정된 직원이 몇명이나 있는가

SELECT COUNT(e.deptno) "부서가 배정된 직원" 
FROM emp e
;
-- 부서가 배정된 직원
--              12

-- COUNT(*) 가 아닌 COUNT(e.deptno)를 사용한 경우에는
SELECT e.deptno
FROM emp e
WHERE e.deptno  IS NOT NULL
;

-- 을 수행한 결과를 카운트 한 것으로 생각할 수있음

-- 문제) 전체인원, 부서 배정 인원, 부서 미배정 인원을 구하시오

SELECT  COUNT(*)  "전체 인원"
        ,COUNT(e.deptno) "배정 인원 "
         ,COUNT(*) - COUNT(e.deptno)  "부서 미배정 인원"
FROM emp e
;

--  SUM(expr) : NULL 항목 제외하고
--              합산 가능한 행을 모두 더한 결과를 출력

-- SALESMAN 들의 수당 총합을 구해보자.
SELECT SUM (e.comm)   "수당 총합"
FROM emp e 
WHERE e.job = 'SALESMAN'
;
-- 수당총합
--  2200

-- 수당 총합 결과에 숫자 출력 패턴을 적용 $, 세자리 끊어 읽기 적용
SELECT TO_CHAR(SUM (e.comm),'$9,999')   "수당 총합"
FROM emp e 
WHERE e.job = 'SALESMAN'
;
-- 수당 총합
--  $2,200

--3) AVG(expr) : NULL 값 제외하고 연산 가능한 항목의 산술 평균을 구함
--      SALESMAN 의  수당 평균을 구해보자
--      수당 평균 결과에 숫자 출력 패턴 $ 세자리 끊어 읽기 적용
 
SELECT   TO_CHAR(AVG(e.comm),'$9,999')  "SALESMAN의 수당 평균"    
FROM   emp e 
WHERE  e.job = 'SALESMAN'
;

-- 4) MAX(expr) : expr에 등장한 값 중 최대값을 구함
--          expr이 문자인 경우 알파벳순 뒤쪽에 위치한 글자를
--          최대값으로 계산

-- 이름이 가장 나중인 직원
SELECT MAX(e.ename) "이름이 가장 나중인 직원"
FROM emp e
;
-- 이름이 가장 나중인 직원
--WARD

SELECT MIN(e.ename) "이름이 가장 앞인 직원"
FROM emp e
;
-- 이름이 가장 앞인 직원
--ALLEN

------ 3. GROUP BY 절의 사용
--   문제) 각 부서별로 급여의 총합 , 평균 , 쵀대 , 최소를 조회

-- 총합

-- 1. 각 부서별로 급여의 총합을 조회하려면 
-- 총합 : SUM()을 사용
-- 그룹화 기준을 부서 번호 (deptno)를 사용
-- GROUP BY 절이 등장해야 함

-- A) 먼저 emp테이블에서 급여 총합을 구하는 구문 작성
SELECT SUM(e.sal) "급여 총합"
FROM emp e 
;
--B) 부서 번호를 기준으로 그룹화 진행
--   SUM () 은 그룹함수다.
--   GROUP BY 절을 조합하면 그룹화 가능하다.
--   그룹화를 하려면 기준컬럼이 GROUP BY 절에 등장 해야 함.

SELECT   e.deptno "부서번호"   -- 그룹화 기준컬럼으로 SELECT 절에 등장
        ,SUM(e.sal) "부서 급여 총합"  -- 그룹함수가 사용된 컬럼
FROM emp e 
GROUP BY e.deptno    -- 그룹화 기준컬럼으로 GROUP BY 절에 등장
ORDER BY e.deptno -- 부서번호 정렬
;

-- GROUP BY 절에 그룹화 기준 컬럼으로 등장한 컬럼이 아닌 것이
-- SELECT 절에 등장하면 오류, 실행 불가

SELECT   e.deptno "부서번호"   -- 그룹화 기준컬럼으로 SELECT 절에 등장
        ,e.job -- 그룹화 기준 컬럼이 아닌데 SELECT 절에 등장 -> 오류의 원인
        ,SUM(e.sal) "부서 급여 총합"  -- 그룹함수가 사용된 컬럼
FROM emp e 
GROUP BY e.deptno    -- 그룹화 기준컬럼으로 GROUP BY 절에 등장
ORDER BY e.deptno -- 부서번호 정렬
;
/*ORA-00979: GROUP BY 표현식이 아닙니다.
00979. 00000 -  "not a GROUP BY expression"
*Cause:    
*Action:
211행, 44열에서 오류 발생
*/

-- 무제) 부서별로 급여의 총합, 평균 , 최대 , 최소

SELECT   TO_CHAR(SUM(e.sal), '$9,999')     " 부서 급여 총합 "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  "부서 급여 평균 "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " 부서 급여 최대"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " 부서 급여 최소"
    
FROM emp e
GROUP BY e.deptno
ORDER BY e.deptno
;

/*
 부서 급여 총합 , 부서 급여 평균 ,  부서 급여 최대,  부서 급여 최소
 -----------------------------------
 $8,750	 $2,916.67	 $5,000	 $1,300
 $6,775	 $2,258.33	 $3,000	   $800
 $9,400	 $1,566.67	 $2,850	   $950	
*/

-- 위의 쿼리는 수행되지만 정확하게 어느 부서의 결과인지 알 수 없다는 단점이 존재
-- 그래서 GROUP BY 절에 등장하는 기준컬럼은 SELECT 절에 똑같이 등장하는 편이
-- 결과 해석에 편리하다.

--SELECT 절에 나열된 컬럼중에서 그룹함수가 사용되지 않는 컬럼이 없기 때문에
-- 위의 쿼리는 수행되는 것이다.

-- 부서별 직무별 급여의 총합 평균 최대 최소 구해보자

SELECT   e.deptno "부서번호"
         ,e.job   "직무" 
         ,TO_CHAR(SUM(e.sal), '$9,999')     " 부서 급여 총합 "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  "부서 급여 평균 "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " 부서 급여 최대"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " 부서 급여 최소"
FROM emp e
GROUP BY e.deptno, e.job
ORDER BY e.deptno
;

/*
부서번호, 직무,  부서 급여 총합 , 부서 급여 평균 ,  부서 급여 최대,  부서 급여 최소
--------------------------------------------------
    10	CLERK	     $1,300	 $1,300.00	    $1,300	 $1,300
    10	MANAGER	     $2,450	 $2,450.00	     $2,450	 $2,450
    10	PRESIDENT	 $5,000	 $5,000.00	    $5,000	 $5,000
    20	ANALYST	    $3,000	 $3,000.00	     $3,000	 $3,000
    20	CLERK	     $800	   $800.00	      $800	   $800
    20	MANAGER	     $2,975	 $2,975.00	    $2,975	 $2,975
    30	CLERK	      $950	   $950.00	      $950	   $950
    30	MANAGER	     $2,850	 $2,850.00	     $2,850	 $2,850
    30	SALESMAN	 $5,600	 $1,400.00	     $1,600	 $1,250
        CLERK				
					
*/

SELECT   e.deptno "부서번호"
         ,e.job   "직무"       -- SELECT에는 등장
         ,TO_CHAR(SUM(e.sal), '$9,999')     " 부서 급여 총합 "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  "부서 급여 평균 "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " 부서 급여 최대"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " 부서 급여 최소"
FROM emp e
GROUP BY e.deptno   -- GROUP BY 에는 누락된 JOB 컬럼
ORDER BY e.deptno
;

-- B) SELECT 절에 그룹함수와 일반 컬럼이 섞여 등장
-- GROUB BY 절 전체가 누락된 경우

SELECT   e.deptno "부서번호"
         ,e.job   "직무" 
         SUM(e.sal)     " 부서 급여 총합 "
        AVG(e.sal)  "부서 급여 평균 "
       MAX(e.sal)     " 부서 급여 최대"
       MIN(e.sal)      " 부서 급여 최소"
FROM emp e
-- GROUP BY e.deptno, e.job     -- GROUP BY 에는 누락된 JOB의 컬럼 
ORDER BY e.deptno
;
/*
ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
294행, 10열에서 오류 발생
*/

-- 문제 직무(JOB) 별 급여의 총합, 평균, 최대, 최소를 구해보자
--      별칭 :직무 , 급여 총합 , 급여평균 , 최대 급여, 최소급여

SELECT     NVL( e.job ,'직무 미배정')  직무           
            ,SUM(e.sal) "급여 총합"
            ,TO_CHAR(AVG(e.sal),'$9,999') "급여 평균"
            ,MAX(e.sal) "최대급여 "
            ,MIN(e.sal) "최소 급여"
          
FROM emp e 
GROUP BY e.job
ORDER BY e.job
;
-- 직무가 미배정인 사람들은 직무명 대신 '직무 미배정' 으로 출력


-- 부서별 총합, 평균, 최대, 최소 
-- 부서번호가 null인 경우 '부서 미배정' 으로 분류되도록 조회

SELECT   NVL( e.deptno,'부서 미 배정')           "부서번호"      
         ,TO_CHAR(SUM(e.sal), '$9,999')     " 부서 급여 총합 "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  "부서 급여 평균 "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " 부서 급여 최대"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " 부서 급여 최소"
FROM emp e
GROUP BY e.deptno 
ORDER BY e.deptno
;

/*
 deptno 는 숫자, 부서미배정은 문자 데이터이므로 타입 불일치
 NVL()이 작동하지 못한다.
 
ORA-01722: 수치가 부적합합니다
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

-- 해결방법 : deptno 의 값을 문자화 TO_CHAR() 사용
SELECT   NVL(TO_CHAR(e.deptno),'부서 미 배정')           "부서번호"      
         ,TO_CHAR(SUM(e.sal), '$9,999')     " 부서 급여 총합 "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  "부서 급여 평균 "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " 부서 급여 최대"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " 부서 급여 최소"
FROM emp e
GROUP BY e.deptno 
ORDER BY e.deptno
;

-- 가장 간단하게 타입을 바꾸는 방법 NULL 때문에
SELECT   NVL(e.deptno || '',  '부서 미 배정')   "부서번호"      
         ,TO_CHAR(SUM(e.sal), '$9,999')     " 부서 급여 총합 "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  "부서 급여 평균 "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " 부서 급여 최대"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " 부서 급여 최소"
FROM emp e
GROUP BY e.deptno 
ORDER BY e.deptno
;
/*
부서번호,  부서 급여 총합 , 부서 급여 평균 ,  부서 급여 최대,  부서 급여 최소
-----------------------------------------
10	 $8,750	 $2,916.67	 $5,000	 $1,300
20	 $6,775	 $2,258.33	 $3,000	   $800
30	 $9,400	 $1,566.67	 $2,850	   $950
부서 미 배정				
*/

-- NVL , DECODE, TO_CHAR 조합으로 해결
SELECT   DECODE(e.deptno ,0 ), e.deptno, TO_CHAR(e.deptno)
                        , 0 , '부서 미배정')   "부서 번호"
         ,TO_CHAR(SUM(e.sal), '$9,999')     "  급여 총합 "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  " 급여 평균 "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " 최대 급여"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " 최소 급여"
FROM emp e
GROUP BY e.deptno 
ORDER BY e.deptno
;

---------- 4. HAVING 절의 사용
-- GROUP BY 결과에 조건을 걸어서
--  그 결과를 제한할 목적으로 사용되는 절.

-- HAVING 절은 WHERE 절과 비슷하지만 SELECT 구문의 실행 순서 때문에
-- GROUP BY 절보다 먼저 실행되는 WHERE 절로는
-- GROUP BY 결과를 제한할 수 없다.

-- 따라서 GROUP BY  다음 수행순서를 가지는 
-- HAVING 에서 제한한다.

-- 문제 ) 부서별 급여 평균이 2000 이상인 부서를 조회 하여라

-- A) 우선 부서별 급여 평균을 구한다.

SELECT  e.deptno    "부서번호"
        ,AVG(e.sal)  "급여 평균"
        
FROM emp e
GROUP BY e.deptno
;

-- b a 의 결과에서 급옆 ㅕㅇ균이 2000 이상인 값만 남긴다
--   HAVING 으로 결과 제한

SELECT  e.deptno    "부서번호"
        ,TO_CHAR(AVG(e.sal),'$9,999,99')  "급여 평균"
        
FROM emp e
GROUP BY e.deptno
HAVING AVG(e.sal) >= 2000 
;
/*
부서번호, 급여 평균
10	    $29,17
20	    $22,58
*/

-- 주의 : HAVING 절에는 별칭을 사용 할 수 없다 ORDER BY 에만 사용 가능

-- HAVING 절이 존저해는 경우 SELECT 구문의 실행 순서 정리
/*
1.FROM 절의 테이블 각 행 모두를 대상으로
2. WHERE 절의 조건에 맞는 행만 선택하고
3. GROUP BY 절에 나온 컬럼, 식 으로 그룹화 진행
4. HAVING  절의 조건을 만족시키는 그룹행만 선택
5.  4까지 선택된 그룹 정보를 가진 행에 대해서 
6. SELECT   절에 명시된 컬럼, 식 만 출력
7. ORDER BY 가 있다면 정렬 조건에 맞추어 최종 정렬하여 결과 출력

*/

수업중 실습

 -- 1. 매니저별, 부하직원의 수를 구하고, 많은 순으로 정렬
--   : mgr 컬럼이 그룹화 기준 컬럼



 -- 2.1 부서별 인원을 구하고, 인원수 많은 순으로 정렬
--    : deptno 컬럼이 그룹화 기준 컬럼

 -- 2.2 부서 배치 미배정 인원 처리


 -- 3.1 직무별 급여 평균 구하고, 급여평균 높은 순으로 정렬
--   : job 이 그룹화 기준 컬럼


 -- 3.2 job 이 null 인 데이터 처리


 -- 4. 직무별 급여 총합 구하고, 총합 높은 순으로 정렬
--   : job 이 그룹화 기준 컬럼


 -- 5. 급여의 앞단위가 1000미만, 1000, 2000, 3000, 5000 별로 인원수를 구하시오
--    급여 단위 오름차순으로 정렬


 -- 6. 직무별 급여 합의 단위를 구하고, 급여 합의 단위가 큰 순으로 정렬



 -- 7. 직무별 급여 평균이 2000이하인 경우를 구하고 평균이 높은 순으로 정렬



 -- 8. 년도별 입사 인원을 구하시오

-- 그룹화 기준 기준 컬럼을 "입사 년도"로 잡는다.

SELECT TO_CHAR(e.hiredate, 'YYYY') "입사 년도"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '01', 1)) "1월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '02', 1)) "2월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '03', 1)) "3월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '04', 1)) "4월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '05', 1)) "5월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '06', 1)) "6월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '07', 1)) "7월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '08', 1)) "8월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '09', 1)) "9월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '10', 1)) "10월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '11', 1)) "11월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '12', 1)) "12월"
        FROM emp e
        GROUP BY TO_CHAR(e.hiredate, 'YYYY')
        ORDER BY "입사 년도"
        ;
        
-- 월별 총 입사 인원의 합을 가로로 출력
-- 그룹화 기준 컬럼이 필요 업음
SELECT '인원(명)' AS "입사 월" 
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '01', 1)) "1월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '02', 1)) "2월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '03', 1)) "3월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '04', 1)) "4월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '05', 1)) "5월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '06', 1)) "6월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '07', 1)) "7월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '08', 1)) "8월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '09', 1)) "9월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '10', 1)) "10월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '11', 1)) "11월"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '12', 1)) "12월"
        FROM emp e
        ;












