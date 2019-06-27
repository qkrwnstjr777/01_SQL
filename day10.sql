-- day 10
---- 7. 조인과 서브쿼리
-- (1) 조인 : JOIN
-- 하나 이상의 테이블을 논리적으로 묶어서 하나의 테이블인 것 처럼 다루는 기술
-- 조인을 발생시키려면 FROM 절에 조인에 사용할 테이블을 나열

-- 문제) 직원의 소속 부서 번호가 아닌 부서 명을 같이 조회하고 싶다.
-- a) FROM 절에 테이블을 나열
-- emp, dept 두 테이블을 나열 ==> 조인이 발생 ==> 두 테이블의 모든 조합
SELECT e.empno
    ,e.ename
    ,'|' "구분자"
    ,d.deptno
    ,d.dname

 FROM emp e
    ,dept d
;
-- ==> (emp)12 X (dept)4 = 48건의 데이터가 조인으로 생성

-- b) 조인 조건이 추가되어야 직원으 ㅣ소속부서만 정확히 연결할 수있다.

SELECT e.empno
    ,e.ename
    ,e.deptno
    ,'|' "구분자"
    ,d.deptno
    ,d.dname

 FROM emp e
    ,dept d
    WHERE e.deptno = d.deptno -- 오라클의 전통적인 조인 조건 작성 방법
    ORDER BY d.deptno
;

-- 조인 연산자를 사용하여 조인 (다른 DBMS 에서 주로 사용)
SELECT e.empno
    ,e.ename
    ,d.dname

 FROM emp e JOIN dept d ON (e.deptno = d.deptno)
 ORDER BY d.deptno
;

-- 위의 결과에서 ACCOUNTING 부서 직원만 알고 싶다.
-- 10번 부서 직원을 조회하여라

SELECT e.empno
    ,e.ename
    FROM emp e
    WHERE e.deptno = 10
    ;
    
    SELECT e.empno
    ,e.ename
    ,d.dname

 FROM emp e 
        ,dept d
      WHERE e. deptno = d.deptno -- 조인조건
      AND d.dname = 'ACCOUNTING' -- 일반 조건
;

-- ACCOUNTTING 부서 소속인 직원 조회를
-- 조인 연산자를 사용한 쿼리로 변경 해보세요

SELECT e.empno
    ,e.ename
    ,d.dname

 FROM emp e JOIN dept d ON (e.deptno = d.deptno)
 WHERE d.dname = 'ACCOUNTING' -- 일반조건
 
;
-- 2) 조인 : 카티션 곱 (카티션 조인)
--      조인 대상 테이블의 데이터를 가능한 모든 조합으로 엮는 것
--      WHERE 절에 조인 조건 누락시 발생
--      CROSS JOIN 연산자로 발생시킴(오라클 9I 버전 이후로 사용가능)

-- emp, dept, salgrade 세 개의 테이블로 카디션 곱 발생
SELECT   e.ename
        ,d.dname
        ,s.grade
FROM emp e
    ,dept d
    ,salgrade s
;

-- CROSS JOIN 연산자를 사용하면
SELECT e.ename
        ,d.dname
        ,s.grade
        FROM emp e CROSS JOIN dept d
                    CROSS JOIN salgrade s
                    ;
                    
-- r) EQUI JOIN : 조인의 가장 기본 형태
--                  조인 대상 테이블 사이의 공통 컬럼을 '='로 연결
--                  공통 컬럼을 (join-attribute)라고 부름
-- a) 오라클 전통기법으로 WHERE 절 첫번째 줄에 조인 조건을 주는 방법

SELECT e.ename
        ,e. ename
        ,d. dname
        FROM emp e 
                ,dept d
               WHERE e.deptno = d.deptno -- 오라클의 전통적인 조인 조건 작성 방법
                    ;
-- b) JOIN ~ ON 
SELECT   e.empno
        ,e.ename
        ,d.dname
FROM emp e JOIN dept d ON (e.deptno = d.deptno)
;

-- c) NATURAL JOIN 키워드로 자동 조인
-- : on 절이 없음
-- join-attribute 를 오라클 dbms가 자동으로 판단

SELECT e.empno
        ,e.ename
        ,d.dname
        FROM emp e NATURAL JOIN dept d -- 조인 공통 컬럼 명시가 없음.
        ;
        
-- d) JOIN ~ USING 
SELECT e.empno
        ,e.ename
        ,d.dname
        FROM emp e JOIN dept d USING(deptno) -- USING 뒤에 공통 커럼을 별칭 없이 명시
        ;
        
-- 5) NON-EQUI JOIN : WHERE 조건절에 join-attribute 사용하는 대신
--      다른 비교 연산자를 사용하여 여러 테이블을 엮는 기법

-- 문제) emp, salgrade 테이블을 사용해서 직원의 급여에 따른 등급 

SELECT e.empno
        ,e.ename
        ,e.sal
        ,s.grade
        FROM emp e
        ,salgrade s
        WHERE e.sal BETWEEN s.losal AND s.hisal
        ;

--6) OUTER JOIN : 조인 대상 테이블에서 공통 컬럼에 NULL 값인 데이터도
--                  출력을 원할 때 사용하는 조인 기법

-- 연산자 : (+), LEFR OUTER JOIN, RIGHT OUTER JOIN 

-----------1. (+) : 오라클에서만 사용하는 OUTER JOIN 연산자
--              EQUI-JOIN 조건에서 NULL 값 출력을 원하는 쪽에 붙여서 사용

SELECT e.empno
        ,e.ename
        ,d.dname
        FROM emp e
        ,dept d
        WHERE e.deptno = d.deptno
        ;
        -- JJ, J_JAMES 의 e.deptno는 null이므로 dept 테이블에 일치하는 값이 없으므로
        --  조인 결과로 두 직원이 조회되지않는다.
        
        -- 부서 배치가 되지 않은 직원도 모두 출력은 하고 싶다.
        -- 그러려면 dept 테이블쪽의 데이터가 NULL이어도 추가 출력이 필요.
        
        -- (+) 연산자는 오른쪽에 불이 이는 null 상태로 출력될 테이블을 결정짓는다.
        -- 전체 데이터 기준삼는 테이블이 왼쪽이기 때문에
        -- left outer join 이 발생함.
        
------- 2. LEFT OUTER JOIN ~ ON

SELECT  e.empno
        ,e.ename
        ,d.dname
FROM    emp e LEFT OUTER JOIN dept d ON (e.deptno = d.deptno)
;

-- ON 절에 쓰인 조인 조건은 EQUI-JOIN 과 동일하지만
-- LEFT OUTER JOIN 연산자에 의해
-- 이 연산자 왼쪽에 위치한 테이블의 모든 데이터는 출력을 보장받는다.
-- 결과는 (+) 연산자를 오른쪽에 붙인 결과와 동일 

-- 부하 직원이 없는 직원들 조회

SELECT  e.empno "사번"
        ,e.ename "이름"
        ,e.mgr "상사 사번"
        ,e1.ename "상사이름"
        
        
FROM emp e RIGHT OUTER JOIN emp e1 ON (e.mgr = e1.empno)
ORDER BY "사번" DESC
;
/*
사번, 이름, 상사 사번, 상사이름
---------------------------
                TURNER
                MARTIN
                MILLER
                SMITH
                J_JAMES
                ALLEN
                WARD
                JJ
                J%JAMES
                JAMES
7934	MILLER	7782	CLARK
7902	FORD	7566	JONES
7900	JAMES	7698	BLAKE
7844	TURNER	7698	BLAKE
7782	CLARK	7839	KING
7698	BLAKE	7839	KING
7654	MARTIN	7698	BLAKE
7566	JONES	7839	KING
7521	WARD	7698	BLAKE
7499	ALLEN	7698	BLAKE
7369	SMITH	7902	FORD
*/
-- RIGHT OUTER JOIN 

-- 수업중 실습 문제)
-- 1. 사번, 이름 , 직무 , 상사이름 , 부서명 , 부서위치를 조회 하시오.
-- emp e, emp e1, dept d
SELECT e.empno "사번"
        ,e.ename  "이름"
        ,e.job  "직무"
        ,e1.ename   "상사이름"
        ,d.dname "부서명"
        ,d.loc   "부서위치"
FROM emp e
     ,emp e1
     , dept d
     WHERE e.mgr = e1.empno
     AND e.deptno = d.deptno
     ORDER BY d.deptno
;

/*  
사번, 이름,        직무,      상사이름,     부서명, 부서위치
-----------------------------------------------------
7782	CLARK	MANAGER	    KING	ACCOUNTING	NEW YORK
7934	MILLER	CLERK	    CLARK	ACCOUNTING	NEW YORK
7902	FORD	ANALYST 	JONES	RESEARCH	DALLAS
7566	JONES	MANAGER	    KING	RESEARCH	DALLAS
7369	SMITH	CLERK	    FORD	RESEARCH	DALLAS
7698	BLAKE	MANAGER	    KING	SALES	    CHICAGO
7521	WARD	SALESMAN	BLAKE	SALES	    CHICAGO
7654	MARTIN	SALESMAN	BLAKE	SALES	    CHICAGO
7844	TURNER	SALESMAN	BLAKE	SALES	    CHICAGO
7900	JAMES	CLERK	    BLAKE	SALES	    CHICAGO
7499	ALLEN	SALESMAN	BLAKE	SALES	    CHICAGO
*/






-- 2. 사번, 이름 , 급여, 급여등급, 부서명, 부서위치 를 조회 하시오.
-- emp e, dept d, salgrade s 
SELECT  e.empno  사번
        ,e.ename    이름
        ,e.sal  급여
        ,s.grade    급여등급    
        ,d.dname    부서명
        ,d.loc  부서위치

FROM emp e
     , dept d
     , salgrade s
    WHERE e.sal BETWEEN s.losal AND s.hisal
    AND e.deptno = d.deptno
;

/*
사번,    이름,   급여, 급여등급, 부서명, 부서위치
-------------------------------------------------
7839	KING	5000	5	ACCOUNTING	NEW YORK
7902	FORD	3000	4	RESEARCH	DALLAS
7566	JONES	2975	4	RESEARCH	DALLAS
7698	BLAKE	2850	4	SALES	    CHICAGO
7782	CLARK	2450	4	ACCOUNTING	NEW YORK
7499	ALLEN	1600	3	SALES	    CHICAGO
7844	TURNER	1500	3	SALES	    CHICAGO
7934	MILLER	1300	2	ACCOUNTING	NEW YORK
7521	WARD	1250	2	SALES	    CHICAGO
7654	MARTIN	1250	2	SALES	    CHICAGO
7900	JAMES	950	    1	SALES	    CHICAGO
7369	SMITH	800	1	    RESEARCH	DALLAS
*/

-- 위의 구문을 JOIN ~ ON 으로 변경 

SELECT  e.empno  사번
        ,e.ename    이름
        ,e.sal  급여
        ,s.grade    급여등급    
        ,d.dname    부서명
        ,d.loc  부서위치

FROM emp e  JOIN dept d ON (e.deptno = d.deptno)
            JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal)
;
/*
사번, 이름, 급여, 급여등급, 부서명, 부서위치
--------------------------------------------------
7839	KING	5000	5	ACCOUNTING	NEW YORK
7902	FORD	3000	4	RESEARCH	DALLAS
7566	JONES	2975	4	RESEARCH	DALLAS
7698	BLAKE	2850	4	SALES	CHICAGO
7782	CLARK	2450	4	ACCOUNTING	NEW YORK
7499	ALLEN	1600	3	SALES	CHICAGO
7844	TURNER	1500	3	SALES	CHICAGO
7934	MILLER	1300	2	ACCOUNTING	NEW YORK
7521	WARD	1250	2	SALES	CHICAGO
7654	MARTIN	1250	2	SALES	CHICAGO
7900	JAMES	950	1	SALES	CHICAGO
7369	SMITH	800	1	RESEARCH	DALLAS
*/

-- 부서가 배정되지 않은 직원도 모두 출력하시오
-- (+) 연산자로 해결




-- LEFT OUTER JOIN ~ ON 으로 해결

-- 부서가 배정되지 않은 직원은
-- 부서명, 부서위치 대신 '-' 이 출력되도록 하시오

SELECT  e.empno
        ,e.ename
        ,'-' "구분자"
        ,d.dname
FROM  emp e,
        dept d
        WHERE e.deptno = d.deptno
        ORDER BY d.deptno
;
    
    
    
    