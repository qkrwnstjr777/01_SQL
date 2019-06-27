-- û���� ���� IT ���� �߰� �׽�Ʈ 1�� : SQL
/*
���� : ��ǻ�� ���а�                   
�̸� : ���ؼ�
�г� : 2016244089
*/

-- emp���̺���
--1.	��� ������ ���, �̸�, ����, �޿��� ��ȸ�Ͻÿ�. 

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

--2.	�Ŵ����� �ִ� ������ ���, �̸�, �Ŵ��� ����� ��ȸ�Ͻÿ�.

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

--3.	��� ������ ���Ͽ�, ���, �̸�, �޿�, �� �޿��� ��ȸ�Ͻÿ�.

SELECT  e.empno
        ,e.ename
        ,e.sal
        ,e.sal * 12  "�� �޿�"
FROM emp e
;
/*
EMPNO, ENAME,   SAL,    �� �޿�
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
        
--4.	30�� �μ� �Ҽ��� ������ ���, �̸�, �μ���ȣ�� ��ȸ�Ͻÿ�.
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


--5.	�޿��� 2000 ~ 4000 ������ ������ ���, �̸�, �޿��� ��ȸ�Ͻÿ�.

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

--6.	������ �޴� ������ ���, �̸�, ������ ��ȸ�Ͻÿ�.

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


--7.	�������� �޿��� 10% �λ�� ��Ȳ�� �����ϰ�, 
--      ���� �޿��κ��� 10% �λ�� �޿��� ���Ͽ� 
--      ���, �̸�, ���޿�, ���λ�޿� �� ������ ��ȸ�Ͻÿ�.

SELECT   e.empno
        ,e.ename 
        ,e.sal
        ,e.sal * 1.1 "�� �λ�޿�" 
FROM emp e
;
/*
EMPNO, ENAME, SAL, �� �λ�޿�
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


--8.	10�� �μ� �Ҽ��� ������ ���Ͽ� �޿��� 15% �λ�� ��Ȳ�� �����ϰ�, 
--      ���� �޿��κ��� 15%�λ�� �޿��� ���Ͽ� 
--      ���, �̸�, ���޿�, �λ��, ���λ�޿�, �μ���ȣ �� ��ȸ�Ͻÿ�.


--9.	��� ������ ���Ͽ� ���޿��� 2500 �����̰�
--      15% �λ�� �޿��� 2800�� �Ѵ� ������ 
--      ���, �̸�, ���޿�, ���λ�޿�, �μ���ȣ�� ��ȸ�Ͻÿ�.



--10.	�̸��� E�� ���� ������ ���, �̸��� ��ȸ�Ͻÿ�.



--dept ���̺���
--1.	BOSTON �� ��ġ�� �μ��� ��� ������ ��ȸ�Ͻÿ�.
SELECT *
FROM dept
WHERE LOC = 'BOSTON'
;
/*
DEPTNO, DNAME,   LOC
-----------------------
40	OPERATIONS	BOSTON
*/

--2.	DALLAS, NEW YORK �� ��ġ�� �μ��� ��� ������ ��ȸ�Ͻÿ�.







