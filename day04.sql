SELECT     e.empno
           ,e.ename
           ,e.sal

FROM emp e 
WHERE e.sal = 800
OR    e.sal= 3000
OR    e.sal= 5000;
SELECT     e.empno
           ,e.ename
           ,e.sal

FROM emp e 
WHERE e.sal IN (800,3000,5000);
SELECT e.empno
    ,e.ename
    ,e. sal
FROM emp e
WHERE e.sal < 2000;
SELECT e.empno
    ,e.ename
    ,e. sal
FROM emp e
WHERE e.sal >= 2000;
SELECT     e.empno
           ,e.ename
           ,e.job
           ,e.sal
           ,e.comm
           , e.sal + e.comm "�� ���ɱ�"
FROM emp e
WHERE e.job = 'SALESMAN';
SELECT     e.empno
           ,e.ename
           ,e.job
           ,e.sal
           ,e.comm
           , e.sal + e.comm "�� ���ɱ�"
FROM emp e
WHERE e.job = 'salesman';
SELECT     e.empno
           ,e.ename
           ,e.job
           ,e.sal
           ,e.comm
           , e.sal + e.comm "�� ���ɱ�"
FROM emp e;
SELECT     e.empno
           ,e.ename
           ,e.job
           , e.sal + e.comm "�� ���ɱ�"
FROM emp e;
SELECT    e.empno
         ,e.ename
         ,e.sal
         ,e.comm
FROM emp e
WHERE e.comm>0;
SELECT    e.empno
           ,e.ename
           ,e.sal

FROM emp e
WHERE e.sal>=1000
AND  e.sal<=2000;
SELECT    e.empno
           ,e.ename
           ,e.sal

FROM emp e
WHERE e.sal>=1000
AND  e.sal<2000;
SELECT    e.empno
           ,e.ename
           ,e.sal

FROM emp e
WHERE e.sal>1000 AND e.sal<2000;
SELECT e.empno
       ,e.ename
       ,e.sal
FROM emp e
WHERE e.sal>=1000;
SELECT e.empno ���
        ,e.ename �̸�
        ,e.sal �޿�
FROM emp e
WHERE e.sal > 2000;
SELECT e.empno ���
        ,e.ename �̸�
        ,e.sal �޿�
FROM emp e;
SELECT e.empno  -- ���̺� ��Ī�� ��� �Ǵ� ��ġ : �÷� �̸� �� 
    ,e.ename     
    FROM emp e  -- ���̺� ��Ī ��� ��ġ;
SELECT  empno
    ,ename
    ,sal

FROM  emp
ORDER BY sal ASC
;
SELECT job
FROM emp;
SELECT e.empno
       ,e.ename
       ,e.sal
       ,e.sal * 0.033 tax 
       ,e.sal * 0.967 "REAL SAL"
       ,e. sal * (1.033) "REAL SAL"
FROM emp e;
SELECT job
 FROM emp;
SELECT DISTINCT job
                ,deptno
 FROM emp;
SELECT DISTINCT job 
 FROM emp
 ORDER BY job ASC;
SELECT  empno  "���"
    ,ename �̸�
        ,sal �޿�
    ,hiredate �Ի���
FROM emp;
SELECT empno
,ename
,job
,hiredate
FROM emp;
-- SQL day 03: 
-- WHERE ������ 

-- * SQL SELECT ������ �۵� ���� :
-- >> ���̺�(FROM ���� ������)�� �� ���� �⺻ ������ �����Ѵ�.
-- >> ���̺� ���� ������ŭ �ݺ� �����Ѵ�.
-- ���� ������ ���� ������ �����Ѵٸ� ����� ��� �ɱ�
SELECT 'HELLO, SQL~'  -- �÷����� �ƴ� ������ ���� ��ȸ�ϸ� ��� �ǳ�
FROM emp
;
/*
'HELLO,SQL~'
-------------
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
*/
-- 16) 

SELECT 'HELLO, SQL~'  AS greeting 
    ,empno
    ,ename
FROM emp
;
/*
'HELLO,SQL~', EMPNO, ENAME
----------------------------
HELLO, SQL~	7369	SMITH
HELLO, SQL~	7499	ALLEN
HELLO, SQL~	7521	WARD
HELLO, SQL~	7566	JONES
HELLO, SQL~	7654	MARTIN
HELLO, SQL~	7698	BLAKE
HELLO, SQL~	7782	CLARK
HELLO, SQL~	7839	KING
HELLO, SQL~	7844	TURNER
HELLO, SQL~	7900	JAMES
HELLO, SQL~	7902	FORD
HELLO, SQL~	7934	MILLER
*/
/*
GREETING, EMPNO, ENAME
---------------------------
HELLO, SQL~	7369	SMITH
HELLO, SQL~	7499	ALLEN
HELLO, SQL~	7521	WARD
HELLO, SQL~	7566	JONES
HELLO, SQL~	7654	MARTIN
HELLO, SQL~	7698	BLAKE
HELLO, SQL~	7782	CLARK
HELLO, SQL~	7839	KING
HELLO, SQL~	7844	TURNER
HELLO, SQL~	7900	JAMES
HELLO, SQL~	7902	FORD
HELLO, SQL~	7934	MILLER
*/

-- WHERE ������
-- 16) emp ���̺��� empno �� 7900�� �����
-- ���,�̸�,����,�Ի���,�޿�,�μ���ȣ�� ��ȸ 

SELECT EMPNO
     e,ENAME
     e,JOB
    e,HIREDATE
    e,SAL
    e,DEPTNO
FROM emp e
WHERE e.empno = 7900
;

--17) emp ���̺��� empno �� 7900 �̰ų� deptno �� 20�� ������
-- ���,�̸�,����,�Ի���,�޿�,�μ���ȣ�� ��ȸ�Ͻÿ�
SELECT e.empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
  FROM emp e
WHERE e.empno = 7900
OR e.deptno = 20
;
/*
EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO
----------------------------------------
7900	JAMES	CLERK	81/12/03	950	30
*/
/*
EMPNO, ENAME,   JOB, HIREDATE, SAL, DEPTNO
----------------------------------------
7369	SMITH	CLERK	80/12/17	800	    20
7566	JONES	MANAGER	81/04/02	2975	20
7900	JAMES	CLERK	81/12/03	950	    30
7902	FORD	ANALYST	81/12/03	3000	20
*/

-- 18) 17���� ��ȸ ����(empno �� 7900, deptno�� 20)�� and�� ����
-- ��ȸ�غ���.
-- EMP ���̺��� EMPNO�� 7900�̰� DEPTNO�� 20�� ������ 
-- ���,�̸�,����,�Ի���,�޿�,�μ���ȣ�� ��ȸ�Ͻÿ�.

SELECT empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
    FROM emp e
WHERE e.EMPNO = 7900
    AND e.DEPTNO = 20
;
-- ����� ��� �� : 0
-- >> WHERE ���� ���� �����ϴ� ���� emp ���̺� �������� �����Ƿ�
-- ��ȸ�� ���� 1�ǵ� ������ �ǹ�. ���� ����� �ƴԿ� ����
-- ���� SELECT ���� ������ �÷����� �����ϴ� ����� Ȯ��

-- 19) job�� 'CLERK' �̸鼭 deptno �� 10�� ������
-- ���,�̸�,����,�μ���ȣ�� ��ȸ�Ͻÿ�.
-- ���ǿ� ���ڿ� �񱳰� ���� ����
SELECT e.empno
     ,e.ename   
     ,e.job
     ,e.deptno
FROM emp e
WHERE  e.job = 'CLERK'  -- ���ڰ� �񱳽ÿ��� �ݵ�� �� ���ڸ� ''�� ���Ѵ�
  AND e.deptno = 10  -- ���ڰ� �񱳽ÿ��� ����ǥ ��� ����
;
/*
EMPNO, ENAME,   JOB,   HIREDATE
---------------------------------
7934	MILLER	CLERK	82/01/23
*/
SELECT e.empno
     ,e.ename   
     ,e.job
     ,e.deptno
FROM emp e
WHERE  e.job = 'CLERK'  -- ���ڰ� �񱳽ÿ��� �ݵ�� �� ���ڸ� ''�� ���Ѵ�
  AND e.deptno = 10  -- ���ڰ� �񱳽ÿ��� ����ǥ ��� ����
;

-- ����� ��� ��: 0
-- >> CLERK �̶�� ���� �����Ϳ� �������� �����Ƿ�
-- CLERK ���� �����ϴ� �����Ϳ� ��ҹ��ڰ� ��ġ���� ������
-- �ٸ� ������ ó���Ѵ�.

-- (6) ������ : 1.��������� 
-- (21) EMP ���̺���
-- ���,�̸�,�޿��� ��ȸ�ϰ�
-- �޿��� 3.3% �� �ش��ϴ� ��õ¡�� ������ ����Ͽ� ��ȸ�Ͻÿ�.

-- ���� ���ɾ׿� �ش��ϴ� 96.7%�� �޿��� ����Ͽ� ��ȸ

SELECT e.empno
       ,e.ename
       ,e.sal
       ,e.sal * 0.033 tax 
       ,e.sal * 0.967 "REAL SAL"
       ,e. sal * (1.033) "REAL SAL"
FROM emp e
;
/*
EMPNO, ENAME,    SAL,      TAX,    REAL SAL
-------------------------------------
7369	SMITH	800	    26.4	773.6
7499	ALLEN	1600	52.8	1547.2
7521	WARD	1250	41.25	1208.75
7566	JONES	2975	98.175	2876.825
7654	MARTIN	1250	41.25	1208.75
7698	BLAKE	2850	94.05	2755.95
7782	CLARK	2450	80.85	2369.15
7839	KING	5000	165	    4835
7844	TURNER	1500	49.5	1450.5
7900	JAMES	950	    31.35	918.65
7902	FORD	3000	99	    2901
7934	MILLER	1300	42.9	1257.1
*/










SELECT 'HELLO, SQL~' AS greting -- �÷����� �ƴ� ������ ���� ��ȸ�ϸ� ��� �ǳ�
FROM emp;
SELECT  empno  "���"
        ,ename   "�� ��"
        ,job  "����"
FROM emp;
SELECT empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
FROM emp e
WHERE EMPNO = 7900
AND DEPTNO = 20;
SELECT e.empno
       ,e.ename
       ,e.sal
       ,e.sal * 0.033 tax 
FROM emp e;
SELECT 'HELLO, SQL~'  AS greeting 
    ,empno
    ,ename
FROM emp;
SELECT e.empno
     ,e.ename   
     ,e.job
     ,e.deptno
FROM emp e
WHERE  e.job = 'CLERK'  -- ���ڰ� �񱳽ÿ��� �ݵ�� �� ���ڸ� ''�� ���Ѵ�
  AND e.deptno = 10  -- ���ڰ� �񱳽ÿ��� ����ǥ ��� ����;
SELECT  empno
    ,ename
    ,hiredate
FROM emp
ORDER BY hiredate DESC;
SELECT DISTINCT job  
 FROM emp;
SELECT  empno AS "���"
        ,ename   "�̸�"
        ,job  "����"
FROM emp;
SELECT e.empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
  FROM emp e
WHERE e.empno = 7900
OR e.deptno = 20;
SELECT empno
    , ename
    , sal   
FROM emp
ORDER BY sal ASC;
SELECT e.empno
       ,e.ename
       ,e.sal * 0.033 tax 
FROM emp e;
SELECT 'HELLO, SQL~'
FROM emp;
SELECT 'HELLO, SQL~'  AS greting 
    ,empno
    ,ename
FROM emp;
SELECT empno
    ,ename
    ,job
    ,hiredate
    ,comm
 FROM emp
 ORDER BY comm DESC;
SELECT e.empno  ���
        ,e.ename �̸�
        ,e.job   ���� 
        ,e.hiredate  �Ի���
        ,e.comm     ���� 
FROM   emp e
ORDER BY  comm , job , ename;
SELECT e.empno
       ,e.ename
       ,e.sal
       ,e.sal * 0.033 tax 
       ,e.sal * 0.967 "REAL SAL"
FROM emp e;
SELECT DISTINCT job 
 FROM emp
 ORDER BY job;
SELECT empno
    ,ename
    ,job

FROM emp;
SELECT  empno
    ,ename
    ,hiredate
FROM emp
ORDER BY hiredate ASC;
SELECT DISTINCT job,deptno
 FROM emp;
SELECT e.empno
     ,e.ename   
     ,e.job
     ,e.hiredate
FROM emp e
WHERE  e.job = 'CLERK'
  AND e.deptno = 10;
SELECT EMPNO
     e,ENAME
     e,JOB
    e,HIREDATE
    e,SAL
    e,DEPTNO
FROM emp e;
SELECT empno
    ,ename
    ,job
FROM emp;
SELECT job
      ,deptno

 FROM emp;
SELECT e.empno
     ,e.ename   
     ,e.job
     ,e.hiredate
FROM emp e
WHERE  e.job = 'CLERK'  -- ���ڰ� �񱳽ÿ��� �ݵ�� �� ���ڸ� ''�� ���Ѵ�
  AND e.deptno = 10  -- ���ڰ� �񱳽ÿ��� ����ǥ ��� ����;
SELECT  empno AS "���"
        ,ename   "�� ��"
        ,job  "����"
FROM emp;
ALTER SESSION

SET "_ORACLE_SCRIPT"= true;
SELECT empno

FROM emp;
SELECT job,sal
 FROM emp;
SELECT *
FROM emp;
SELECT e.empno  ���
        ,e.ename �̸�
        ,e.job   ���� 
        ,e.hiredate  �Ի���
        ,e.comm     ���� 
FROM   emp e
ORDER BY  ���� , ���� , ����;
SELECT *
 FROM emp;
SELECT e.empno AS EmployeeNo
        ,e.ename "Employee Name"
        ,e.job "Job Name"
FROM emp   e;
SELECT e.empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
  FROM emp e
WHERE e.empno = 7900;
SELECT empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
    FROM emp e
WHERE e.EMPNO = 7900
    AND e.DEPTNO = 20;
SELECT DISTINCT job
 FROM emp;
SELECT  emp.empno
        ,emp.ename
 FROM emp;
SELECT DISTINCT job 
 FROM emp 
 ORDER BY job ASC;
SELECT DISTINCT job 
 FROM emp 
 ORDER BY job DESC;
SELECT e.empno
       ,e.ename
       ,e.sal * 0.5
FROM emp e;
SELECT job
      ,deptno
      ,sal
 FROM emp;
SELECT *
 FROM dept;
SELECT  empno AS "���"
        ,ename   "�̸�"
        ,job AS "����"
FROM emp;
SELECT 'HELLO, SQL~' 
    ,empno
    ,ename
FROM emp;
SELECT e.empno
    ,e.ename
    FROM emp e;
SELECT empno
    ,ename
    ,job
    ,hiredate
    ,comm

FROM emp 
ORDER BY comm ASC , job ASC , ename ASC;
SELECT EMPNO
     e,ENAME
     e,JOB
    e,HIREDATE
    e,SAL
    e,DEPTNO
FROM emp e
WHERE e.empno = 7900;
SELECT  empno
    ,ename
    ,sal

FROM  emp
ORDER BY sal DESC;
SELECT job,deptno
 FROM emp;
SELECT empno AS "Employee NO."
    ,ename "Employee Name"    -- AS Ű����� ��������
    ,job  "Job Name"    --AS Ű����� ���� ���� 

FROM emp;
SELECT e.empno
       ,e.ename
       ,e.sal * 0.033
FROM emp e;
@C:\app\Administrator\product\18.0.0\dbhomeXE\rdbms\admin\scott.sql
SELECT empno
    ,ename
    ,job
    ,sal
FROM emp
ORDER BY sal DESC;
SELECT empno
    , ename
    , sal   
FROM emp
ORDER BY sal DESC;
SELECT empno
    ,ename
    ,job
    ,hiredate
    ,comm
FROM emp
ORDER BY comm ASC , job ASC , ename DESC;
SELECT empno
    , ename
    , sal   
FROM emp
ORDER BY sal DESC;
SELECT empno
    ,ename
    ,job
    ,sal
FROM emp
ORDER BY sal DESC;
@C:\app\Administrator\product\18.0.0\dbhomeXE\rdbms\admin\scott.sql
SELECT e.empno
       ,e.ename
       ,e.sal * 0.033
FROM emp e;
SELECT empno AS "Employee NO."
    ,ename "Employee Name"    -- AS Ű����� ��������
    ,job  "Job Name"    --AS Ű����� ���� ���� 

FROM emp;
SELECT job,deptno
 FROM emp;
SELECT  empno
    ,ename
    ,sal

FROM  emp
ORDER BY sal DESC;
SELECT EMPNO
     e,ENAME
     e,JOB
    e,HIREDATE
    e,SAL
    e,DEPTNO
FROM emp e
WHERE e.empno = 7900;
SELECT empno
    ,ename
    ,job
    ,hiredate
    ,comm

FROM emp 
ORDER BY comm ASC , job ASC , ename ASC;
SELECT e.empno
    ,e.ename
    FROM emp e;
SELECT 'HELLO, SQL~' 
    ,empno
    ,ename
FROM emp;
SELECT  empno AS "���"
        ,ename   "�̸�"
        ,job AS "����"
FROM emp;
SELECT *
 FROM dept;
SELECT job
      ,deptno
      ,sal
 FROM emp;
SELECT e.empno
       ,e.ename
       ,e.sal * 0.5
FROM emp e;
SELECT DISTINCT job 
 FROM emp 
 ORDER BY job DESC;
SELECT DISTINCT job 
 FROM emp 
 ORDER BY job ASC;
SELECT  emp.empno
        ,emp.ename
 FROM emp;
SELECT DISTINCT job
 FROM emp;
SELECT empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
    FROM emp e
WHERE e.EMPNO = 7900
    AND e.DEPTNO = 20;
SELECT e.empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
  FROM emp e
WHERE e.empno = 7900;
SELECT e.empno AS EmployeeNo
        ,e.ename "Employee Name"
        ,e.job "Job Name"
FROM emp   e;
SELECT *
 FROM emp;
SELECT e.empno  ���
        ,e.ename �̸�
        ,e.job   ���� 
        ,e.hiredate  �Ի���
        ,e.comm     ���� 
FROM   emp e
ORDER BY  ���� , ���� , ����;
SELECT *
FROM emp;
SELECT job,sal
 FROM emp;
SELECT empno

FROM emp;
ALTER SESSION

SET "_ORACLE_SCRIPT"= true;
SELECT  empno AS "���"
        ,ename   "�� ��"
        ,job  "����"
FROM emp;
SELECT e.empno
     ,e.ename   
     ,e.job
     ,e.hiredate
FROM emp e
WHERE  e.job = 'CLERK'  -- ���ڰ� �񱳽ÿ��� �ݵ�� �� ���ڸ� ''�� ���Ѵ�
  AND e.deptno = 10  -- ���ڰ� �񱳽ÿ��� ����ǥ ��� ����;
SELECT job
      ,deptno

 FROM emp;
SELECT empno
    ,ename
    ,job
FROM emp;
SELECT EMPNO
     e,ENAME
     e,JOB
    e,HIREDATE
    e,SAL
    e,DEPTNO
FROM emp e;
SELECT e.empno
     ,e.ename   
     ,e.job
     ,e.hiredate
FROM emp e
WHERE  e.job = 'CLERK'
  AND e.deptno = 10;
SELECT DISTINCT job,deptno
 FROM emp;
SELECT  empno
    ,ename
    ,hiredate
FROM emp
ORDER BY hiredate ASC;
SELECT empno
    ,ename
    ,job

FROM emp;
SELECT DISTINCT job 
 FROM emp
 ORDER BY job;
SELECT e.empno
       ,e.ename
       ,e.sal
       ,e.sal * 0.033 tax 
       ,e.sal * 0.967 "REAL SAL"
FROM emp e;
SELECT e.empno  ���
        ,e.ename �̸�
        ,e.job   ���� 
        ,e.hiredate  �Ի���
        ,e.comm     ���� 
FROM   emp e
ORDER BY  comm , job , ename;
SELECT empno
    ,ename
    ,job
    ,hiredate
    ,comm
 FROM emp
 ORDER BY comm DESC;
SELECT 'HELLO, SQL~'  AS greting 
    ,empno
    ,ename
FROM emp;
SELECT 'HELLO, SQL~'
FROM emp;
SELECT e.empno
       ,e.ename
       ,e.sal * 0.033 tax 
FROM emp e;
SELECT empno
    , ename
    , sal   
FROM emp
ORDER BY sal ASC;
SELECT e.empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
  FROM emp e
WHERE e.empno = 7900
OR e.deptno = 20;
SELECT  empno AS "���"
        ,ename   "�̸�"
        ,job  "����"
FROM emp;
SELECT DISTINCT job  
 FROM emp;
SELECT  empno
    ,ename
    ,hiredate
FROM emp
ORDER BY hiredate DESC;
SELECT e.empno
     ,e.ename   
     ,e.job
     ,e.deptno
FROM emp e
WHERE  e.job = 'CLERK'  -- ���ڰ� �񱳽ÿ��� �ݵ�� �� ���ڸ� ''�� ���Ѵ�
  AND e.deptno = 10  -- ���ڰ� �񱳽ÿ��� ����ǥ ��� ����;
SELECT 'HELLO, SQL~'  AS greeting 
    ,empno
    ,ename
FROM emp;
SELECT e.empno
       ,e.ename
       ,e.sal
       ,e.sal * 0.033 tax 
FROM emp e;
SELECT empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
FROM emp e
WHERE EMPNO = 7900
AND DEPTNO = 20;
SELECT  empno  "���"
        ,ename   "�� ��"
        ,job  "����"
FROM emp;
SELECT 'HELLO, SQL~' AS greting -- �÷����� �ƴ� ������ ���� ��ȸ�ϸ� ��� �ǳ�
FROM emp;
-- SQL day 03: 
-- WHERE ������ 

-- * SQL SELECT ������ �۵� ���� :
-- >> ���̺�(FROM ���� ������)�� �� ���� �⺻ ������ �����Ѵ�.
-- >> ���̺� ���� ������ŭ �ݺ� �����Ѵ�.
-- ���� ������ ���� ������ �����Ѵٸ� ����� ��� �ɱ�
SELECT 'HELLO, SQL~'  -- �÷����� �ƴ� ������ ���� ��ȸ�ϸ� ��� �ǳ�
FROM emp
;
/*
'HELLO,SQL~'
-------------
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
*/
-- 16) 

SELECT 'HELLO, SQL~'  AS greeting 
    ,empno
    ,ename
FROM emp
;
/*
'HELLO,SQL~', EMPNO, ENAME
----------------------------
HELLO, SQL~	7369	SMITH
HELLO, SQL~	7499	ALLEN
HELLO, SQL~	7521	WARD
HELLO, SQL~	7566	JONES
HELLO, SQL~	7654	MARTIN
HELLO, SQL~	7698	BLAKE
HELLO, SQL~	7782	CLARK
HELLO, SQL~	7839	KING
HELLO, SQL~	7844	TURNER
HELLO, SQL~	7900	JAMES
HELLO, SQL~	7902	FORD
HELLO, SQL~	7934	MILLER
*/
/*
GREETING, EMPNO, ENAME
---------------------------
HELLO, SQL~	7369	SMITH
HELLO, SQL~	7499	ALLEN
HELLO, SQL~	7521	WARD
HELLO, SQL~	7566	JONES
HELLO, SQL~	7654	MARTIN
HELLO, SQL~	7698	BLAKE
HELLO, SQL~	7782	CLARK
HELLO, SQL~	7839	KING
HELLO, SQL~	7844	TURNER
HELLO, SQL~	7900	JAMES
HELLO, SQL~	7902	FORD
HELLO, SQL~	7934	MILLER
*/

-- WHERE ������
-- 16) emp ���̺��� empno �� 7900�� �����
-- ���,�̸�,����,�Ի���,�޿�,�μ���ȣ�� ��ȸ 

SELECT EMPNO
     e,ENAME
     e,JOB
    e,HIREDATE
    e,SAL
    e,DEPTNO
FROM emp e
WHERE e.empno = 7900
;

--17) emp ���̺��� empno �� 7900 �̰ų� deptno �� 20�� ������
-- ���,�̸�,����,�Ի���,�޿�,�μ���ȣ�� ��ȸ�Ͻÿ�
SELECT e.empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
  FROM emp e
WHERE e.empno = 7900
OR e.deptno = 20
;
/*
EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO
----------------------------------------
7900	JAMES	CLERK	81/12/03	950	30
*/
/*
EMPNO, ENAME,   JOB, HIREDATE, SAL, DEPTNO
----------------------------------------
7369	SMITH	CLERK	80/12/17	800	    20
7566	JONES	MANAGER	81/04/02	2975	20
7900	JAMES	CLERK	81/12/03	950	    30
7902	FORD	ANALYST	81/12/03	3000	20
*/

-- 18) 17���� ��ȸ ����(empno �� 7900, deptno�� 20)�� and�� ����
-- ��ȸ�غ���.
-- EMP ���̺��� EMPNO�� 7900�̰� DEPTNO�� 20�� ������ 
-- ���,�̸�,����,�Ի���,�޿�,�μ���ȣ�� ��ȸ�Ͻÿ�.

SELECT empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
    FROM emp e
WHERE e.EMPNO = 7900
    AND e.DEPTNO = 20
;
-- ����� ��� �� : 0
-- >> WHERE ���� ���� �����ϴ� ���� emp ���̺� �������� �����Ƿ�
-- ��ȸ�� ���� 1�ǵ� ������ �ǹ�. ���� ����� �ƴԿ� ����
-- ���� SELECT ���� ������ �÷����� �����ϴ� ����� Ȯ��

-- 19) job�� 'CLERK' �̸鼭 deptno �� 10�� ������
-- ���,�̸�,����,�μ���ȣ�� ��ȸ�Ͻÿ�.
-- ���ǿ� ���ڿ� �񱳰� ���� ����
SELECT e.empno
     ,e.ename   
     ,e.job
     ,e.deptno
FROM emp e
WHERE  e.job = 'CLERK'  -- ���ڰ� �񱳽ÿ��� �ݵ�� �� ���ڸ� ''�� ���Ѵ�
  AND e.deptno = 10  -- ���ڰ� �񱳽ÿ��� ����ǥ ��� ����
;
/*
EMPNO, ENAME,   JOB,   HIREDATE
---------------------------------
7934	MILLER	CLERK	82/01/23
*/
SELECT e.empno
     ,e.ename   
     ,e.job
     ,e.deptno
FROM emp e
WHERE  e.job = 'CLERK'  -- ���ڰ� �񱳽ÿ��� �ݵ�� �� ���ڸ� ''�� ���Ѵ�
  AND e.deptno = 10  -- ���ڰ� �񱳽ÿ��� ����ǥ ��� ����
;

-- ����� ��� ��: 0
-- >> CLERK �̶�� ���� �����Ϳ� �������� �����Ƿ�
-- CLERK ���� �����ϴ� �����Ϳ� ��ҹ��ڰ� ��ġ���� ������
-- �ٸ� ������ ó���Ѵ�.

-- (6) ������ : 1.��������� 
-- (21) EMP ���̺���
-- ���,�̸�,�޿��� ��ȸ�ϰ�
-- �޿��� 3.3% �� �ش��ϴ� ��õ¡�� ������ ����Ͽ� ��ȸ�Ͻÿ�.

-- ���� ���ɾ׿� �ش��ϴ� 96.7%�� �޿��� ����Ͽ� ��ȸ

SELECT e.empno
       ,e.ename
       ,e.sal
       ,e.sal * 0.033 tax 
       ,e.sal * 0.967 "REAL SAL"
       ,e. sal * (1.033) "REAL SAL"
FROM emp e
;
/*
EMPNO, ENAME,    SAL,      TAX,    REAL SAL
-------------------------------------
7369	SMITH	800	    26.4	773.6
7499	ALLEN	1600	52.8	1547.2
7521	WARD	1250	41.25	1208.75
7566	JONES	2975	98.175	2876.825
7654	MARTIN	1250	41.25	1208.75
7698	BLAKE	2850	94.05	2755.95
7782	CLARK	2450	80.85	2369.15
7839	KING	5000	165	    4835
7844	TURNER	1500	49.5	1450.5
7900	JAMES	950	    31.35	918.65
7902	FORD	3000	99	    2901
7934	MILLER	1300	42.9	1257.1
*/










SELECT empno
,ename
,job
,hiredate
FROM emp;
SELECT  empno  "���"
    ,ename �̸�
        ,sal �޿�
    ,hiredate �Ի���
FROM emp;
SELECT DISTINCT job 
 FROM emp
 ORDER BY job ASC;
SELECT DISTINCT job
                ,deptno
 FROM emp;
SELECT job
 FROM emp;
SELECT e.empno
       ,e.ename
       ,e.sal
       ,e.sal * 0.033 tax 
       ,e.sal * 0.967 "REAL SAL"
       ,e. sal * (1.033) "REAL SAL"
FROM emp e;
SELECT job
FROM emp;
SELECT  empno
    ,ename
    ,sal

FROM  emp
ORDER BY sal ASC;
SELECT e.empno  -- ���̺� ��Ī�� ��� �Ǵ� ��ġ : �÷� �̸� �� 
    ,e.ename     
    FROM emp e  -- ���̺� ��Ī ��� ��ġ;
SELECT e.empno ���
        ,e.ename �̸�
        ,e.sal �޿�
FROM emp e;
SELECT e.empno ���
        ,e.ename �̸�
        ,e.sal �޿�
FROM emp e
WHERE e.sal > 2000;
SELECT e.empno
       ,e.ename
       ,e.sal
FROM emp e
WHERE e.sal>=1000;
SELECT    e.empno
           ,e.ename
           ,e.sal

FROM emp e
WHERE e.sal>1000 AND e.sal<2000;
SELECT    e.empno
           ,e.ename
           ,e.sal

FROM emp e
WHERE e.sal>=1000
AND  e.sal<2000;
SELECT    e.empno
           ,e.ename
           ,e.sal

FROM emp e
WHERE e.sal>=1000
AND  e.sal<=2000;
SELECT    e.empno
         ,e.ename
         ,e.sal
         ,e.comm
FROM emp e
WHERE e.comm>0;
SELECT     e.empno
           ,e.ename
           ,e.job
           , e.sal + e.comm "�� ���ɱ�"
FROM emp e;
SELECT     e.empno
           ,e.ename
           ,e.job
           ,e.sal
           ,e.comm
           , e.sal + e.comm "�� ���ɱ�"
FROM emp e;
SELECT     e.empno
           ,e.ename
           ,e.job
           ,e.sal
           ,e.comm
           , e.sal + e.comm "�� ���ɱ�"
FROM emp e
WHERE e.job = 'salesman';
SELECT     e.empno
           ,e.ename
           ,e.job
           ,e.sal
           ,e.comm
           , e.sal + e.comm "�� ���ɱ�"
FROM emp e
WHERE e.job = 'SALESMAN';
SELECT e.empno
    ,e.ename
    ,e. sal
FROM emp e
WHERE e.sal >= 2000;
SELECT e.empno
    ,e.ename
    ,e. sal
FROM emp e
WHERE e.sal < 2000;
SELECT     e.empno
           ,e.ename
           ,e.sal

FROM emp e 
WHERE e.sal IN (800,3000,5000);
SELECT     e.empno
           ,e.ename
           ,e.sal

FROM emp e 
WHERE e.sal = 800
OR    e.sal= 3000
OR    e.sal= 5000;

----------------------------------
-- LIKE ������ : ���� ���� �˻��Ҷ� ���.
-- ��Ȯ�� ���� ���� ���Ҷ� ���.

-- LIKE �������� ���� ���� : ���� �� �˻��� ����
�����ڿ� �Բ� ����ϴ� ��ȣ
-- %  : �� ��ȣ�� �ڸ��� 0�ڸ��� �̻��� ��� ���ڰ� �� �� ����
--_: �� ��ȣ�� �ڸ��� 1�ڸ��� ��� ���ڰ� �� �� ����

--26) �̸��� J�� �����ϴ� ������
--          ���,�̸� ��ȸ
SELECT      e.empno
             ,e.ename
             
FROM emp e 
WHERE e.ename LIKE 'J%'
;
/*
EMPNO, ENAME
-------------
7566	JONES
7900	JAMES
*/

-- �̸��� M���� �����ϴ� ������ ���, �̸� ��ȸ

SELECT  e.empno
         ,e.ename
         
FROM emp e
WHERE e.ename LIKE 'M%'
;
/*
EMPNO, ENAME
----------------
7654	MARTIN
7934	MILLER
*/








