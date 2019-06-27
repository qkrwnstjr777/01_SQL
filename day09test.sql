-- 1. 매니저별, 부하직원의 수를 구하고, 많은 순으로 정렬
--   : mgr 컬럼이 그룹화 기준 컬럼

SELECT     e.mgr 
          ,COUNT (e.deptno) "부하직원 수"
FROM emp e
GROUP BY e.mgr
ORDER BY COUNT(e.mgr) DESC
;

 -- 2.1 부서별 인원을 구하고, 인원수 많은 순으로 정렬
--    : deptno 컬럼이 그룹화 기준 컬럼

SELECT   e.job    "직무"
FROM emp e 
;




 -- 2.2 부서 배치 미배정 인원 처리
 SELECT e.deptno "부서 번호" 
        ,COUNT(e.deptno)   "인원"
 FROM emp e
  WHERE e.deptno IS NOT NULL
 GROUP BY e.deptno
 ;



 -- 3.1 직무별 급여 평균 구하고, 급여평균 높은 순으로 정렬
--   : job 이 그룹화 기준 컬럼
    
     SELECT      e.job   "직무"
                ,TO_CHAR(AVG(e.sal),'$9,999') "급여 평균"
  FROM emp e
GROUP BY e.job  
     ;
 
 
 
 
 -- 3.2 job 이 null 인 데이터 처리
     SELECT  *
     FROM emp e
     WHERE  e.job  IS NOT NULL
     ;

 -- 4. 직무별 급여 총합 구하고, 총합 높은 순으로 정렬
--   : job 이 그룹화 기준 컬럼
 
 SELECT e.job "직무"
            ,SUM(e.sal) "총합"   
 FROM emp e
 WHERE e.job IS NOT NULL
 GROUP BY e.job
 ORDER BY SUM(e.sal) DESC
 ;
 
 

 -- 5. 급여의 앞단위가 1000미만, 1000, 2000, 3000, 5000 별로 인원수를 구하시오
--    급여 단위 오름차순으로 정렬

 SELECT
 FROM
 ;




 -- 6. 직무별 급여 합의 단위를 구하고, 급여 합의 단위가 큰 순으로 정렬
   SELECT  e.job "직무"
            ,TO_CHAR(SUM(e.sal),'$9,999')  "급여 합" 
   FROM emp e 
   WHERE e.job IS NOT NULL
   GROUP BY e.job
  ORDER BY SUM(e.sal) DESC
   ;


 -- 7. 직무별 급여 평균이 2000이하인 경우를 구하고 평균이 높은 순으로 정렬

SELECT  e.job    "직무"
        ,TO_CHAR(AVG(e.sal),'$9,999,99')  "급여 평균" 
FROM emp e
GROUP BY e.job
HAVING AVG(e.sal) <= 2000 
ORDER BY AVG(e.sal) ASC
;

/*  
직무,         급여 평균
----------------
CLERK	        $10,17
SALESMAN	    $14,00
*/

 -- 8. 년도별 입사 인원을 구하시오

SELECT   e.hiredate            "년도별"
         ,COUNT (e.hiredate)    "인원"
        
FROM   emp e 
WHERE e.hiredate IS NOT NULL
GROUP BY e.hiredate
;



SELECT SUBSTR(e.hiredate, 1,2)
     , COUNT(SUBSTR(e.hiredate, 1,2))
  FROM emp e
 GROUP BY SUBSTR(e.hiredate, 1,2)
;
