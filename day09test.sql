-- 1. �Ŵ�����, ���������� ���� ���ϰ�, ���� ������ ����
--   : mgr �÷��� �׷�ȭ ���� �÷�

SELECT     e.mgr 
          ,COUNT (e.deptno) "�������� ��"
FROM emp e
GROUP BY e.mgr
ORDER BY COUNT(e.mgr) DESC
;

 -- 2.1 �μ��� �ο��� ���ϰ�, �ο��� ���� ������ ����
--    : deptno �÷��� �׷�ȭ ���� �÷�

SELECT   e.job    "����"
FROM emp e 
;




 -- 2.2 �μ� ��ġ �̹��� �ο� ó��
 SELECT e.deptno "�μ� ��ȣ" 
        ,COUNT(e.deptno)   "�ο�"
 FROM emp e
  WHERE e.deptno IS NOT NULL
 GROUP BY e.deptno
 ;



 -- 3.1 ������ �޿� ��� ���ϰ�, �޿���� ���� ������ ����
--   : job �� �׷�ȭ ���� �÷�
    
     SELECT      e.job   "����"
                ,TO_CHAR(AVG(e.sal),'$9,999') "�޿� ���"
  FROM emp e
GROUP BY e.job  
     ;
 
 
 
 
 -- 3.2 job �� null �� ������ ó��
     SELECT  *
     FROM emp e
     WHERE  e.job  IS NOT NULL
     ;

 -- 4. ������ �޿� ���� ���ϰ�, ���� ���� ������ ����
--   : job �� �׷�ȭ ���� �÷�
 
 SELECT e.job "����"
            ,SUM(e.sal) "����"   
 FROM emp e
 WHERE e.job IS NOT NULL
 GROUP BY e.job
 ORDER BY SUM(e.sal) DESC
 ;
 
 

 -- 5. �޿��� �մ����� 1000�̸�, 1000, 2000, 3000, 5000 ���� �ο����� ���Ͻÿ�
--    �޿� ���� ������������ ����

 SELECT
 FROM
 ;




 -- 6. ������ �޿� ���� ������ ���ϰ�, �޿� ���� ������ ū ������ ����
   SELECT  e.job "����"
            ,TO_CHAR(SUM(e.sal),'$9,999')  "�޿� ��" 
   FROM emp e 
   WHERE e.job IS NOT NULL
   GROUP BY e.job
  ORDER BY SUM(e.sal) DESC
   ;


 -- 7. ������ �޿� ����� 2000������ ��츦 ���ϰ� ����� ���� ������ ����

SELECT  e.job    "����"
        ,TO_CHAR(AVG(e.sal),'$9,999,99')  "�޿� ���" 
FROM emp e
GROUP BY e.job
HAVING AVG(e.sal) <= 2000 
ORDER BY AVG(e.sal) ASC
;

/*  
����,         �޿� ���
----------------
CLERK	        $10,17
SALESMAN	    $14,00
*/

 -- 8. �⵵�� �Ի� �ο��� ���Ͻÿ�

SELECT   e.hiredate            "�⵵��"
         ,COUNT (e.hiredate)    "�ο�"
        
FROM   emp e 
WHERE e.hiredate IS NOT NULL
GROUP BY e.hiredate
;



SELECT SUBSTR(e.hiredate, 1,2)
     , COUNT(SUBSTR(e.hiredate, 1,2))
  FROM emp e
 GROUP BY SUBSTR(e.hiredate, 1,2)
;
