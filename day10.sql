-- day 10
---- 7. ���ΰ� ��������
-- (1) ���� : JOIN
-- �ϳ� �̻��� ���̺��� �������� ��� �ϳ��� ���̺��� �� ó�� �ٷ�� ���
-- ������ �߻���Ű���� FROM ���� ���ο� ����� ���̺��� ����

-- ����) ������ �Ҽ� �μ� ��ȣ�� �ƴ� �μ� ���� ���� ��ȸ�ϰ� �ʹ�.
-- a) FROM ���� ���̺��� ����
-- emp, dept �� ���̺��� ���� ==> ������ �߻� ==> �� ���̺��� ��� ����
SELECT e.empno
    ,e.ename
    ,'|' "������"
    ,d.deptno
    ,d.dname

 FROM emp e
    ,dept d
;
-- ==> (emp)12 X (dept)4 = 48���� �����Ͱ� �������� ����

-- b) ���� ������ �߰��Ǿ�� ������ �ӼҼӺμ��� ��Ȯ�� ������ ���ִ�.

SELECT e.empno
    ,e.ename
    ,e.deptno
    ,'|' "������"
    ,d.deptno
    ,d.dname

 FROM emp e
    ,dept d
    WHERE e.deptno = d.deptno -- ����Ŭ�� �������� ���� ���� �ۼ� ���
    ORDER BY d.deptno
;

-- ���� �����ڸ� ����Ͽ� ���� (�ٸ� DBMS ���� �ַ� ���)
SELECT e.empno
    ,e.ename
    ,d.dname

 FROM emp e JOIN dept d ON (e.deptno = d.deptno)
 ORDER BY d.deptno
;

-- ���� ������� ACCOUNTING �μ� ������ �˰� �ʹ�.
-- 10�� �μ� ������ ��ȸ�Ͽ���

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
      WHERE e. deptno = d.deptno -- ��������
      AND d.dname = 'ACCOUNTING' -- �Ϲ� ����
;

-- ACCOUNTTING �μ� �Ҽ��� ���� ��ȸ��
-- ���� �����ڸ� ����� ������ ���� �غ�����

SELECT e.empno
    ,e.ename
    ,d.dname

 FROM emp e JOIN dept d ON (e.deptno = d.deptno)
 WHERE d.dname = 'ACCOUNTING' -- �Ϲ�����
 
;
-- 2) ���� : īƼ�� �� (īƼ�� ����)
--      ���� ��� ���̺��� �����͸� ������ ��� �������� ���� ��
--      WHERE ���� ���� ���� ������ �߻�
--      CROSS JOIN �����ڷ� �߻���Ŵ(����Ŭ 9I ���� ���ķ� ��밡��)

-- emp, dept, salgrade �� ���� ���̺�� ī��� �� �߻�
SELECT   e.ename
        ,d.dname
        ,s.grade
FROM emp e
    ,dept d
    ,salgrade s
;

-- CROSS JOIN �����ڸ� ����ϸ�
SELECT e.ename
        ,d.dname
        ,s.grade
        FROM emp e CROSS JOIN dept d
                    CROSS JOIN salgrade s
                    ;
                    
-- r) EQUI JOIN : ������ ���� �⺻ ����
--                  ���� ��� ���̺� ������ ���� �÷��� '='�� ����
--                  ���� �÷��� (join-attribute)��� �θ�
-- a) ����Ŭ ���������� WHERE �� ù��° �ٿ� ���� ������ �ִ� ���

SELECT e.ename
        ,e. ename
        ,d. dname
        FROM emp e 
                ,dept d
               WHERE e.deptno = d.deptno -- ����Ŭ�� �������� ���� ���� �ۼ� ���
                    ;
-- b) JOIN ~ ON 
SELECT   e.empno
        ,e.ename
        ,d.dname
FROM emp e JOIN dept d ON (e.deptno = d.deptno)
;

-- c) NATURAL JOIN Ű����� �ڵ� ����
-- : on ���� ����
-- join-attribute �� ����Ŭ dbms�� �ڵ����� �Ǵ�

SELECT e.empno
        ,e.ename
        ,d.dname
        FROM emp e NATURAL JOIN dept d -- ���� ���� �÷� ��ð� ����.
        ;
        
-- d) JOIN ~ USING 
SELECT e.empno
        ,e.ename
        ,d.dname
        FROM emp e JOIN dept d USING(deptno) -- USING �ڿ� ���� Ŀ���� ��Ī ���� ���
        ;
        
-- 5) NON-EQUI JOIN : WHERE �������� join-attribute ����ϴ� ���
--      �ٸ� �� �����ڸ� ����Ͽ� ���� ���̺��� ���� ���

-- ����) emp, salgrade ���̺��� ����ؼ� ������ �޿��� ���� ��� 

SELECT e.empno
        ,e.ename
        ,e.sal
        ,s.grade
        FROM emp e
        ,salgrade s
        WHERE e.sal BETWEEN s.losal AND s.hisal
        ;

--6) OUTER JOIN : ���� ��� ���̺��� ���� �÷��� NULL ���� �����͵�
--                  ����� ���� �� ����ϴ� ���� ���

-- ������ : (+), LEFR OUTER JOIN, RIGHT OUTER JOIN 

-----------1. (+) : ����Ŭ������ ����ϴ� OUTER JOIN ������
--              EQUI-JOIN ���ǿ��� NULL �� ����� ���ϴ� �ʿ� �ٿ��� ���

SELECT e.empno
        ,e.ename
        ,d.dname
        FROM emp e
        ,dept d
        WHERE e.deptno = d.deptno
        ;
        -- JJ, J_JAMES �� e.deptno�� null�̹Ƿ� dept ���̺� ��ġ�ϴ� ���� �����Ƿ�
        --  ���� ����� �� ������ ��ȸ�����ʴ´�.
        
        -- �μ� ��ġ�� ���� ���� ������ ��� ����� �ϰ� �ʹ�.
        -- �׷����� dept ���̺����� �����Ͱ� NULL�̾ �߰� ����� �ʿ�.
        
        -- (+) �����ڴ� �����ʿ� ���� �̴� null ���·� ��µ� ���̺��� �������´�.
        -- ��ü ������ ���ػ�� ���̺��� �����̱� ������
        -- left outer join �� �߻���.
        
------- 2. LEFT OUTER JOIN ~ ON

SELECT  e.empno
        ,e.ename
        ,d.dname
FROM    emp e LEFT OUTER JOIN dept d ON (e.deptno = d.deptno)
;

-- ON ���� ���� ���� ������ EQUI-JOIN �� ����������
-- LEFT OUTER JOIN �����ڿ� ����
-- �� ������ ���ʿ� ��ġ�� ���̺��� ��� �����ʹ� ����� ����޴´�.
-- ����� (+) �����ڸ� �����ʿ� ���� ����� ���� 

-- ���� ������ ���� ������ ��ȸ

SELECT  e.empno "���"
        ,e.ename "�̸�"
        ,e.mgr "��� ���"
        ,e1.ename "����̸�"
        
        
FROM emp e RIGHT OUTER JOIN emp e1 ON (e.mgr = e1.empno)
ORDER BY "���" DESC
;
/*
���, �̸�, ��� ���, ����̸�
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

-- ������ �ǽ� ����)
-- 1. ���, �̸� , ���� , ����̸� , �μ��� , �μ���ġ�� ��ȸ �Ͻÿ�.
-- emp e, emp e1, dept d
SELECT e.empno "���"
        ,e.ename  "�̸�"
        ,e.job  "����"
        ,e1.ename   "����̸�"
        ,d.dname "�μ���"
        ,d.loc   "�μ���ġ"
FROM emp e
     ,emp e1
     , dept d
     WHERE e.mgr = e1.empno
     AND e.deptno = d.deptno
     ORDER BY d.deptno
;

/*  
���, �̸�,        ����,      ����̸�,     �μ���, �μ���ġ
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






-- 2. ���, �̸� , �޿�, �޿����, �μ���, �μ���ġ �� ��ȸ �Ͻÿ�.
-- emp e, dept d, salgrade s 
SELECT  e.empno  ���
        ,e.ename    �̸�
        ,e.sal  �޿�
        ,s.grade    �޿����    
        ,d.dname    �μ���
        ,d.loc  �μ���ġ

FROM emp e
     , dept d
     , salgrade s
    WHERE e.sal BETWEEN s.losal AND s.hisal
    AND e.deptno = d.deptno
;

/*
���,    �̸�,   �޿�, �޿����, �μ���, �μ���ġ
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

-- ���� ������ JOIN ~ ON ���� ���� 

SELECT  e.empno  ���
        ,e.ename    �̸�
        ,e.sal  �޿�
        ,s.grade    �޿����    
        ,d.dname    �μ���
        ,d.loc  �μ���ġ

FROM emp e  JOIN dept d ON (e.deptno = d.deptno)
            JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal)
;
/*
���, �̸�, �޿�, �޿����, �μ���, �μ���ġ
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

-- �μ��� �������� ���� ������ ��� ����Ͻÿ�
-- (+) �����ڷ� �ذ�




-- LEFT OUTER JOIN ~ ON ���� �ذ�

-- �μ��� �������� ���� ������
-- �μ���, �μ���ġ ��� '-' �� ��µǵ��� �Ͻÿ�

SELECT  e.empno
        ,e.ename
        ,'-' "������"
        ,d.dname
FROM  emp e,
        dept d
        WHERE e.deptno = d.deptno
        ORDER BY d.deptno
;
    
    
    
    