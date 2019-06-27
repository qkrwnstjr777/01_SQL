-- day05
-- (6) ������ 7.������ �켱����

/*
�־��� ���� 3��
1. mgr = 7698
2. job - 'CLERK'
3. sal > 1300

�� ������ ���� ������ ����
����� ��� �޶������� Ȯ���� ����
*/

-- 1) �Ŵ����� ����� 7698 �̸�, ������ 'CLERK' �̰ų� 
-- �޿��� 1300�� �Ѵ� ������ �����ϴ� ������ ������ ��ȸ
-- ���, �̸�, ���� , �޿� , �Ŵ������

SELECT   e.empno    
        ,e.ename
        ,e.job
        ,e.sal
        ,e.mgr
FROM emp e 
WHERE e.mgr = 7698 
AND  e.job = 'CLERK' 
OR e.sal >1300 
;
/*
EMPNO, ENAME,       JOB,     SAL,    MGR
------------------------------------------
7499	ALLEN	SALESMAN	1600	7698
7566	JONES	MANAGER	    2975	7839
7698	BLAKE	MANAGER	    2850	7839
7782	CLARK	MANAGER	    2450	7839
7839	KING	PRESIDENT	5000	
7844	TURNER	SALESMAN	1500	7698
7900	JAMES	CLERK	    950	    7698
7902	FORD	ANALYST	    3000	7566
*/

--2) �Ŵ����� 7698�� ���� �߿���
-- ������ 'CLERK' �̰ų� �޿��� 1300�� �Ѵ� ������ �����ϴ� 
-- ������ ������ ��ȸ

SELECT   e.empno    
        ,e.ename
        ,e.job
        ,e.sal
        ,e.mgr
FROM emp e 
WHERE e.mgr = 7698 
AND (e.job = 'CLERK' OR  e.sal > 1300) 
;

/*
EMPNO, ENAME,      JOB,     SAL, MGR
----------------------------------------
7499	ALLEN	SALESMAN	1600	7698
7844	TURNER	SALESMAN	1500	7698
7900	JAMES	CLERK	    950	    7698
*/

SELECT   e.empno    
        ,e.ename
        ,e.job
        ,e.sal
        ,e.mgr
FROM emp e 
WHERE e.job = 'CLERK'
OR e.sal > 1300 
AND e.mgr = 7698
;
/*
EMPNO, ENAME,    JOB,            SAL, MGR
-------------------------------------------
7369	SMITH	CLERK	    800	    7902
7499	ALLEN	SALESMAN	1600	7698
7844	TURNER	SALESMAN	1500	7698
7900	JAMES	CLERK	    950	    7698
7934	MILLER	CLERK	    1300	7782
9999	J_JAMES	CLERK		
8888	J%JAMES	CLERK		
*/

-- AND �����ڴ� OR �����ں��� �켱������ ���� ������
-- �ι�° ����ó�� ��ȣ�� ������� �ʾƵ�
-- ���� ����� �����ϰ� ���´�.

SELECT   e.empno    
        ,e.ename
        ,e.job
        ,e.sal
        ,e.mgr
FROM emp e 
WHERE e.job = 'CLERK'
OR (e.sal > 1300 AND e.mgr = 7698)
;
/*
EMPNO, ENAME, JOB,           SAL, MGR
-----------------------------------------
7369	SMITH	CLERK	    800	    7902
7499	ALLEN	SALESMAN	1600	7698
7844	TURNER	SALESMAN	1500	7698
7900	JAMES	CLERK	    950	    7698
7934	MILLER	CLERK	    1300	7782
9999	J_JAMES	CLERK		
8888	J%JAMES	CLERK		
*/

--------------- 6. �Լ�

-- (3) ������ �Լ�
-------- 1) �����Լ�:
 -------- 1. MOD(m,n) : m�� n���� ���� ������ ��� �Լ�
 
 SELECT mod(10,3)
 FROM emp
 ;
-- ��� : 1�� emp���̺��� �� �� ��ŭ �ݺ� ��� 

SELECT mod (10,3) AS ������
FROM dept
;
-- ��� : 1�� dept ���̺��� �� ���� 4�� �ݺ� ���

-- ���� �� ����� �޿��� 3���� ���� �������� ��ȸ
SELECT  mod (e.sal,3) AS �޿�
FROM emp e
;

-- ���� EMP���̺��� �� ����� �޿���
-- 3���� ���� �������� ����� �Բ� ��ȸ �Ͻÿ�
-- ����� ���� ��ȸ�ǵ��� �Ͻÿ�

SELECT e.empno
    ,mod(e.sal,3)
FROM emp e
        ;
/*
EMPNO, MOD(E.SAL,3)
--------------
7369	2
7499	1
7521	2
7566	2
7654	2
7698	0
7782	2
7839	2
7844	0
7900	2
7902	0
7934	1
9999	
8888	
*/

-- ������ �Լ��� ���̺��� 1��� 1���� ����

------------ 2 ROUND (m,n) : �Ǽ� m�� �Ҽ��� n+1 �ڸ����� �ݿø� �� ��� ���

SELECT  ROUND(1234.56,1)   -- ����� 1234.6
FROM dual
;

SELECT ROUND (1234.56, 0)  -- 1235
FROM dual
;

SELECT ROUND (1234.46, 0)  -- 1234
FROM dual
;

-- ROUND(m) : n���� �����ϸ� n= 0 �� ������ ������ ����� ������

SELECT ROUND (1234.46)  -- 1234
FROM dual
;

SELECT ROUND (1234.56)  -- 1235
FROM dual
;

------------------ 3. TRUNC (m,n) : �Ǽ� m�� n���� ������ �ڸ� ���� �Ҽ��� ����
SELECT TRUNC (1234.56, 1)  -- 1234
FROM dual
;

SELECT TRUNC (1234.56, 0)  -- 1234
FROM dual
;

--------- 4.CEIL(n) �Էµ� �Ǽ� n���� ���ų� ���� ����� ����

SELECT CEIL (1234.56)  -- 1235
FROM dual
;

SELECT CEIL (1234)  -- 1234
FROM dual
;

SELECT CEIL (1234.001)  -- 1235
FROM dual
;

------------ 5. FLOOR(n) : �Էµ� �Ǽ� n���� ���ų� ���� ����� ���� ����

SELECT FLOOR (1234.56)  -- 1234
FROM dual
;

SELECT FLOOR (1234)  -- 1234
FROM dual
;

SELECT FLOOR (1234.56)  -- 1234
FROM dual
;

------------------ 6. WIDTH_BUCKET(expr, min, max, buckets)
-- min ~ max �� ���̸� buckets ���� ��ŭ���� ������ 
-- expr�� ����ϴ� ���� ��� buckets�� ��ġ�ϴ��� ���ڷ� �˷���

-- �޿��� ������ 0~5000 ���� ���, �� bucket�� 1000 ������ ������
-- �� 5���� bucket�� ������ �� �� �����Ƿ�
-- �� ������ �޿��� ��� bucket �� ��ġ�ϴ��� ���غ���
-- �׸��� �޿� ���� �������� ���� 

SELECT e.empno
        ,e.ename
        ,e.sal
        ,WIDTH_BUCKET(e.sal,0,5000,5) as "�޿� ����"
    FROM emp e
 ORDER BY "�޿� ����"
;
/*
EMPNO, ENAME, SAL, �޿� ����
----------------------------
7900	JAMES	950	    1
7369	SMITH	800	    1
7844	TURNER	1500	2
7521	WARD	1250	2
7654	MARTIN	1250	2
7499	ALLEN	1600	2
7934	MILLER	1300	2
7698	BLAKE	2850	3
7566	JONES	2975	3
7782	CLARK	2450	3
7902	FORD	3000	4
7839	KING	5000	6
8888	J%JAMES		
9999	J_JAMES		
*/

