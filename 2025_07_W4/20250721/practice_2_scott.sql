--Show all
SELECT * FROM emp;

--１．社員情報テーブルから入社日が１９８２年１月１以後である社員の情報（社員番号、氏名、担当、給料、入社日、部署番号）を出力
SELECT empno,ename,job,sal,hiredate,deptno FROM emp
WHERE hiredate >= '82-01-01';

--追加
SELECT empno,ename,job,sal,hiredate,deptno FROM emp
WHERE hiredate >= '82/01/01';

SELECT empno,ename,job,sal,hiredate,deptno FROM emp
WHERE hiredate >= '82-JAN-01';

SELECT empno,ename,job,sal,hiredate,deptno FROM emp
WHERE hiredate >= TO_CHAR(TO_DATE('01-JAN-82', 'dd-Month-YY', 'NLS_DATE_LANGUAGE = American'));
-- これは WHERE hiredate >= TO_CHAR(TO_DATE('01-1月-82', 'dd-Month-YY', 'NLS_DATE_LANGUAGE = Japanese'));と同じ

--２．社員情報テーブル（emp）で社員番号が7902, 7788, 7566である社員の情報（社員番号、氏名、担当、給料、入社日）を出力
SELECT empno,ename,job,sal,hiredate FROM emp
WHERE empno IN (7902, 7788, 7566);

--３．社イン情報テーブルから入社日が８２年入社である社員の情報を社員番号、氏名、担当、給料、入社日、部署番号純で出力
SELECT empno,ename,job,sal,hiredate,deptno FROM emp
WHERE hiredate LIKE '82%';

--４．ボーナスがない社員の情報を社員番号、氏名、担当、給料、入社日、部署番号純で出力
SELECT empno,ename,job,sal,comm,deptno FROM emp
WHERE comm is NULL;

SELECT empno,ename,job,sal,comm,deptno FROM emp
WHERE comm is NULL OR comm = 0;

SELECT empno,ename,job,sal,comm,deptno FROM emp
WHERE NVL(comm, 0) = 0;

--応用素材
SELECT empno, ename, job, sal, comm, deptno FROM emp
WHERE NOT (comm IS NOT NULL AND comm > 0);

--５．給料が1,100$以上で、職務が「Manager」である社員の情報を社員番号、氏名、担当、給料、入社日、部署番号純で出力
SELECT empno,ename,job,sal,hiredate,deptno FROM emp
WHERE sal >= 1100 AND job = 'MANAGER';

--６．職務がManager, Clerk, Analystではない社員の情報を社員番号、氏名、担当、給料、入社日、部署番号純で出力
SELECT empno,ename,job,sal,deptno　FROM emp
WHERE job NOT IN ('MANAGER','CLERK','ANALYST');

--７．入社日純で社員の情報を社員番号、氏名、担当、給料、入社日、部署番号純で出力
SELECT hiredate,empno,ename,job,sal,deptno FROM emp
ORDER BY hiredate;