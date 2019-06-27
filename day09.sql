-- day09 : 
-- 2. ������ �Լ� (�׷��Լ�)

--1) COUNT(*): FROM ���� ������
--              Ư�� ���̺��� ���� ����(�������� ����) �� �����ִ� �Լ�
--              NULL ���� ó���ϴ� "����"�� �׷��Լ�


-- COUNT(expr) : expr ���� ������ ���� null �����ϰ� �����ִ� �Լ� 

-- ���� ) dept, salgrage ���̺��� ��ü ������ ���� ��ȸ
-- 1. dept ���̺� ��ȸ
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

-- 2. dept ���̺��� ������ ���� ��ȸ : COUNT(*) ���
SELECT COUNT(*) AS "�μ� ����"
FROM dept d
;

/*
�μ� ����
------
    4
*/

SELECT d.*
FROM dept d
;

-- salgrade (�޿����) ���̺��� �޿� ��� ������ ��ȸ
SELECT COUNT(*) " �޿� ��� ���� " 
FROM salgrade 
;
-- �޿���� ����
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

-- COUNT(expr) �� null �����͸� ó������ ���ϴ� �� Ȯ���� ���� ������ �߰�
INSERT INTO "SCOTT"."EMP" (EMPNO, ENAME) VALUES ('7777', 'JJ');
COMMIT; 

-- emp ���̺��� job �÷��� ������ ������ ī��Ʈ 

SELECT   COUNT(e. job) "������ ������ ������ ��"
FROM emp e
;
-- ������ ������ ������ ��
-- 14

-- ����) ȸ�翡 �Ŵ����� ������ ������ ����ΰ�
--  ��Ī : ��簡 �ִ� ������ �� 

SELECT  COUNT(e.mgr) "��簡 �ִ� ������ ��"
FROM emp e
;
--��簡�ִ� ������ ��
--11

--  ����) �Ŵ��� ���� �ð� �ִ� ������ ����ΰ�?
--   1. emp���̺��� mgr �÷��� ������ ���¸� �ľ�
--   2. mgr �÷��� �ߺ� �����͸� ����
--   3. �ߺ� �����Ͱ� ���ŵ� ����� ī��Ʈ

SELECT DISTINCT e.mgr     -- e.mgr�� �ߺ��� ���� 
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

-- 3. �ߺ� �����Ͱ� ���ŵ� �����  ī��Ʈ

SELECT  COUNT (DISTINCT e.mgr) "�Ŵ��� ��"
FROM emp e 
;
-- �Ŵ��� ��
--       5

-- ����) �μ��� ������ ������ ����̳� �ִ°�

SELECT COUNT(e.deptno) "�μ��� ������ ����" 
FROM emp e
;
-- �μ��� ������ ����
--              12

-- COUNT(*) �� �ƴ� COUNT(e.deptno)�� ����� ��쿡��
SELECT e.deptno
FROM emp e
WHERE e.deptno  IS NOT NULL
;

-- �� ������ ����� ī��Ʈ �� ������ ������ ������

-- ����) ��ü�ο�, �μ� ���� �ο�, �μ� �̹��� �ο��� ���Ͻÿ�

SELECT  COUNT(*)  "��ü �ο�"
        ,COUNT(e.deptno) "���� �ο� "
         ,COUNT(*) - COUNT(e.deptno)  "�μ� �̹��� �ο�"
FROM emp e
;

--  SUM(expr) : NULL �׸� �����ϰ�
--              �ջ� ������ ���� ��� ���� ����� ���

-- SALESMAN ���� ���� ������ ���غ���.
SELECT SUM (e.comm)   "���� ����"
FROM emp e 
WHERE e.job = 'SALESMAN'
;
-- ��������
--  2200

-- ���� ���� ����� ���� ��� ������ ���� $, ���ڸ� ���� �б� ����
SELECT TO_CHAR(SUM (e.comm),'$9,999')   "���� ����"
FROM emp e 
WHERE e.job = 'SALESMAN'
;
-- ���� ����
--  $2,200

--3) AVG(expr) : NULL �� �����ϰ� ���� ������ �׸��� ��� ����� ����
--      SALESMAN ��  ���� ����� ���غ���
--      ���� ��� ����� ���� ��� ���� $ ���ڸ� ���� �б� ����
 
SELECT   TO_CHAR(AVG(e.comm),'$9,999')  "SALESMAN�� ���� ���"    
FROM   emp e 
WHERE  e.job = 'SALESMAN'
;

-- 4) MAX(expr) : expr�� ������ �� �� �ִ밪�� ����
--          expr�� ������ ��� ���ĺ��� ���ʿ� ��ġ�� ���ڸ�
--          �ִ밪���� ���

-- �̸��� ���� ������ ����
SELECT MAX(e.ename) "�̸��� ���� ������ ����"
FROM emp e
;
-- �̸��� ���� ������ ����
--WARD

SELECT MIN(e.ename) "�̸��� ���� ���� ����"
FROM emp e
;
-- �̸��� ���� ���� ����
--ALLEN

------ 3. GROUP BY ���� ���
--   ����) �� �μ����� �޿��� ���� , ��� , ���� , �ּҸ� ��ȸ

-- ����

-- 1. �� �μ����� �޿��� ������ ��ȸ�Ϸ��� 
-- ���� : SUM()�� ���
-- �׷�ȭ ������ �μ� ��ȣ (deptno)�� ���
-- GROUP BY ���� �����ؾ� ��

-- A) ���� emp���̺��� �޿� ������ ���ϴ� ���� �ۼ�
SELECT SUM(e.sal) "�޿� ����"
FROM emp e 
;
--B) �μ� ��ȣ�� �������� �׷�ȭ ����
--   SUM () �� �׷��Լ���.
--   GROUP BY ���� �����ϸ� �׷�ȭ �����ϴ�.
--   �׷�ȭ�� �Ϸ��� �����÷��� GROUP BY ���� ���� �ؾ� ��.

SELECT   e.deptno "�μ���ȣ"   -- �׷�ȭ �����÷����� SELECT ���� ����
        ,SUM(e.sal) "�μ� �޿� ����"  -- �׷��Լ��� ���� �÷�
FROM emp e 
GROUP BY e.deptno    -- �׷�ȭ �����÷����� GROUP BY ���� ����
ORDER BY e.deptno -- �μ���ȣ ����
;

-- GROUP BY ���� �׷�ȭ ���� �÷����� ������ �÷��� �ƴ� ����
-- SELECT ���� �����ϸ� ����, ���� �Ұ�

SELECT   e.deptno "�μ���ȣ"   -- �׷�ȭ �����÷����� SELECT ���� ����
        ,e.job -- �׷�ȭ ���� �÷��� �ƴѵ� SELECT ���� ���� -> ������ ����
        ,SUM(e.sal) "�μ� �޿� ����"  -- �׷��Լ��� ���� �÷�
FROM emp e 
GROUP BY e.deptno    -- �׷�ȭ �����÷����� GROUP BY ���� ����
ORDER BY e.deptno -- �μ���ȣ ����
;
/*ORA-00979: GROUP BY ǥ������ �ƴմϴ�.
00979. 00000 -  "not a GROUP BY expression"
*Cause:    
*Action:
211��, 44������ ���� �߻�
*/

-- ����) �μ����� �޿��� ����, ��� , �ִ� , �ּ�

SELECT   TO_CHAR(SUM(e.sal), '$9,999')     " �μ� �޿� ���� "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  "�μ� �޿� ��� "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " �μ� �޿� �ִ�"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " �μ� �޿� �ּ�"
    
FROM emp e
GROUP BY e.deptno
ORDER BY e.deptno
;

/*
 �μ� �޿� ���� , �μ� �޿� ��� ,  �μ� �޿� �ִ�,  �μ� �޿� �ּ�
 -----------------------------------
 $8,750	 $2,916.67	 $5,000	 $1,300
 $6,775	 $2,258.33	 $3,000	   $800
 $9,400	 $1,566.67	 $2,850	   $950	
*/

-- ���� ������ ��������� ��Ȯ�ϰ� ��� �μ��� ������� �� �� ���ٴ� ������ ����
-- �׷��� GROUP BY ���� �����ϴ� �����÷��� SELECT ���� �Ȱ��� �����ϴ� ����
-- ��� �ؼ��� ���ϴ�.

--SELECT ���� ������ �÷��߿��� �׷��Լ��� ������ �ʴ� �÷��� ���� ������
-- ���� ������ ����Ǵ� ���̴�.

-- �μ��� ������ �޿��� ���� ��� �ִ� �ּ� ���غ���

SELECT   e.deptno "�μ���ȣ"
         ,e.job   "����" 
         ,TO_CHAR(SUM(e.sal), '$9,999')     " �μ� �޿� ���� "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  "�μ� �޿� ��� "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " �μ� �޿� �ִ�"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " �μ� �޿� �ּ�"
FROM emp e
GROUP BY e.deptno, e.job
ORDER BY e.deptno
;

/*
�μ���ȣ, ����,  �μ� �޿� ���� , �μ� �޿� ��� ,  �μ� �޿� �ִ�,  �μ� �޿� �ּ�
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

SELECT   e.deptno "�μ���ȣ"
         ,e.job   "����"       -- SELECT���� ����
         ,TO_CHAR(SUM(e.sal), '$9,999')     " �μ� �޿� ���� "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  "�μ� �޿� ��� "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " �μ� �޿� �ִ�"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " �μ� �޿� �ּ�"
FROM emp e
GROUP BY e.deptno   -- GROUP BY ���� ������ JOB �÷�
ORDER BY e.deptno
;

-- B) SELECT ���� �׷��Լ��� �Ϲ� �÷��� ���� ����
-- GROUB BY �� ��ü�� ������ ���

SELECT   e.deptno "�μ���ȣ"
         ,e.job   "����" 
         SUM(e.sal)     " �μ� �޿� ���� "
        AVG(e.sal)  "�μ� �޿� ��� "
       MAX(e.sal)     " �μ� �޿� �ִ�"
       MIN(e.sal)      " �μ� �޿� �ּ�"
FROM emp e
-- GROUP BY e.deptno, e.job     -- GROUP BY ���� ������ JOB�� �÷� 
ORDER BY e.deptno
;
/*
ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
294��, 10������ ���� �߻�
*/

-- ���� ����(JOB) �� �޿��� ����, ���, �ִ�, �ּҸ� ���غ���
--      ��Ī :���� , �޿� ���� , �޿���� , �ִ� �޿�, �ּұ޿�

SELECT     NVL( e.job ,'���� �̹���')  ����           
            ,SUM(e.sal) "�޿� ����"
            ,TO_CHAR(AVG(e.sal),'$9,999') "�޿� ���"
            ,MAX(e.sal) "�ִ�޿� "
            ,MIN(e.sal) "�ּ� �޿�"
          
FROM emp e 
GROUP BY e.job
ORDER BY e.job
;
-- ������ �̹����� ������� ������ ��� '���� �̹���' ���� ���


-- �μ��� ����, ���, �ִ�, �ּ� 
-- �μ���ȣ�� null�� ��� '�μ� �̹���' ���� �з��ǵ��� ��ȸ

SELECT   NVL( e.deptno,'�μ� �� ����')           "�μ���ȣ"      
         ,TO_CHAR(SUM(e.sal), '$9,999')     " �μ� �޿� ���� "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  "�μ� �޿� ��� "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " �μ� �޿� �ִ�"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " �μ� �޿� �ּ�"
FROM emp e
GROUP BY e.deptno 
ORDER BY e.deptno
;

/*
 deptno �� ����, �μ��̹����� ���� �������̹Ƿ� Ÿ�� ����ġ
 NVL()�� �۵����� ���Ѵ�.
 
ORA-01722: ��ġ�� �������մϴ�
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

-- �ذ��� : deptno �� ���� ����ȭ TO_CHAR() ���
SELECT   NVL(TO_CHAR(e.deptno),'�μ� �� ����')           "�μ���ȣ"      
         ,TO_CHAR(SUM(e.sal), '$9,999')     " �μ� �޿� ���� "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  "�μ� �޿� ��� "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " �μ� �޿� �ִ�"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " �μ� �޿� �ּ�"
FROM emp e
GROUP BY e.deptno 
ORDER BY e.deptno
;

-- ���� �����ϰ� Ÿ���� �ٲٴ� ��� NULL ������
SELECT   NVL(e.deptno || '',  '�μ� �� ����')   "�μ���ȣ"      
         ,TO_CHAR(SUM(e.sal), '$9,999')     " �μ� �޿� ���� "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  "�μ� �޿� ��� "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " �μ� �޿� �ִ�"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " �μ� �޿� �ּ�"
FROM emp e
GROUP BY e.deptno 
ORDER BY e.deptno
;
/*
�μ���ȣ,  �μ� �޿� ���� , �μ� �޿� ��� ,  �μ� �޿� �ִ�,  �μ� �޿� �ּ�
-----------------------------------------
10	 $8,750	 $2,916.67	 $5,000	 $1,300
20	 $6,775	 $2,258.33	 $3,000	   $800
30	 $9,400	 $1,566.67	 $2,850	   $950
�μ� �� ����				
*/

-- NVL , DECODE, TO_CHAR �������� �ذ�
SELECT   DECODE(e.deptno ,0 ), e.deptno, TO_CHAR(e.deptno)
                        , 0 , '�μ� �̹���')   "�μ� ��ȣ"
         ,TO_CHAR(SUM(e.sal), '$9,999')     "  �޿� ���� "
        ,TO_CHAR(AVG(e.sal), '$9,999.99')  " �޿� ��� "
        ,TO_CHAR(MAX(e.sal), '$9,999')     " �ִ� �޿�"
        ,TO_CHAR(MIN(e.sal), '$9,999')     " �ּ� �޿�"
FROM emp e
GROUP BY e.deptno 
ORDER BY e.deptno
;

---------- 4. HAVING ���� ���
-- GROUP BY ����� ������ �ɾ
--  �� ����� ������ �������� ���Ǵ� ��.

-- HAVING ���� WHERE ���� ��������� SELECT ������ ���� ���� ������
-- GROUP BY ������ ���� ����Ǵ� WHERE ���δ�
-- GROUP BY ����� ������ �� ����.

-- ���� GROUP BY  ���� ��������� ������ 
-- HAVING ���� �����Ѵ�.

-- ���� ) �μ��� �޿� ����� 2000 �̻��� �μ��� ��ȸ �Ͽ���

-- A) �켱 �μ��� �޿� ����� ���Ѵ�.

SELECT  e.deptno    "�μ���ȣ"
        ,AVG(e.sal)  "�޿� ���"
        
FROM emp e
GROUP BY e.deptno
;

-- b a �� ������� �޿� �Ť����� 2000 �̻��� ���� �����
--   HAVING ���� ��� ����

SELECT  e.deptno    "�μ���ȣ"
        ,TO_CHAR(AVG(e.sal),'$9,999,99')  "�޿� ���"
        
FROM emp e
GROUP BY e.deptno
HAVING AVG(e.sal) >= 2000 
;
/*
�μ���ȣ, �޿� ���
10	    $29,17
20	    $22,58
*/

-- ���� : HAVING ������ ��Ī�� ��� �� �� ���� ORDER BY ���� ��� ����

-- HAVING ���� �����ش� ��� SELECT ������ ���� ���� ����
/*
1.FROM ���� ���̺� �� �� ��θ� �������
2. WHERE ���� ���ǿ� �´� �ุ �����ϰ�
3. GROUP BY ���� ���� �÷�, �� ���� �׷�ȭ ����
4. HAVING  ���� ������ ������Ű�� �׷��ุ ����
5.  4���� ���õ� �׷� ������ ���� �࿡ ���ؼ� 
6. SELECT   ���� ��õ� �÷�, �� �� ���
7. ORDER BY �� �ִٸ� ���� ���ǿ� ���߾� ���� �����Ͽ� ��� ���

*/

������ �ǽ�

 -- 1. �Ŵ�����, ���������� ���� ���ϰ�, ���� ������ ����
--   : mgr �÷��� �׷�ȭ ���� �÷�



 -- 2.1 �μ��� �ο��� ���ϰ�, �ο��� ���� ������ ����
--    : deptno �÷��� �׷�ȭ ���� �÷�

 -- 2.2 �μ� ��ġ �̹��� �ο� ó��


 -- 3.1 ������ �޿� ��� ���ϰ�, �޿���� ���� ������ ����
--   : job �� �׷�ȭ ���� �÷�


 -- 3.2 job �� null �� ������ ó��


 -- 4. ������ �޿� ���� ���ϰ�, ���� ���� ������ ����
--   : job �� �׷�ȭ ���� �÷�


 -- 5. �޿��� �մ����� 1000�̸�, 1000, 2000, 3000, 5000 ���� �ο����� ���Ͻÿ�
--    �޿� ���� ������������ ����


 -- 6. ������ �޿� ���� ������ ���ϰ�, �޿� ���� ������ ū ������ ����



 -- 7. ������ �޿� ����� 2000������ ��츦 ���ϰ� ����� ���� ������ ����



 -- 8. �⵵�� �Ի� �ο��� ���Ͻÿ�

-- �׷�ȭ ���� ���� �÷��� "�Ի� �⵵"�� ��´�.

SELECT TO_CHAR(e.hiredate, 'YYYY') "�Ի� �⵵"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '01', 1)) "1��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '02', 1)) "2��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '03', 1)) "3��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '04', 1)) "4��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '05', 1)) "5��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '06', 1)) "6��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '07', 1)) "7��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '08', 1)) "8��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '09', 1)) "9��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '10', 1)) "10��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '11', 1)) "11��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '12', 1)) "12��"
        FROM emp e
        GROUP BY TO_CHAR(e.hiredate, 'YYYY')
        ORDER BY "�Ի� �⵵"
        ;
        
-- ���� �� �Ի� �ο��� ���� ���η� ���
-- �׷�ȭ ���� �÷��� �ʿ� ����
SELECT '�ο�(��)' AS "�Ի� ��" 
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '01', 1)) "1��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '02', 1)) "2��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '03', 1)) "3��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '04', 1)) "4��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '05', 1)) "5��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '06', 1)) "6��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '07', 1)) "7��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '08', 1)) "8��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '09', 1)) "9��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '10', 1)) "10��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '11', 1)) "11��"
        ,COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '12', 1)) "12��"
        FROM emp e
        ;












