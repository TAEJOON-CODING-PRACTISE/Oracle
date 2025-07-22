--Show all
SELECT * FROM emp;

--１．社員テーブルからscott社員の情報を社員番号、氏名、担当業務（小文字）、部署番号純で出力
SELECT empno,ename,LOWER(job),deptno FROM emp
WHERE LOWER(ename) = 'scott';

--２．部署テーブルから部署名を頭文字だけ大文字で変換してすべての情報を順番通り出力
SELECT deptno,INITCAP(dname),INITCAP(loc)
FROM dept;

--３．社員テーブルから１０番部署に対して、社員番号、氏名、担当業務を出力して、そのあとは社員番号と、氏名を合わせて「E_NAME」という別名を利用して出力し、
--社員名と社員番号を合わせて「E_EMPNO」という別名で出力して、最後には社員名と担当業務を合わせて「E_JOB」という別名で出力
SELECT empno,ename,job,CONCAT(empno,ename) e_name, CONCAT(empno, ename) e_empno,CONCAT(ename,job) e_job FROM emp
WHERE deptno = 10;

--４．社員テーブルから名前の頭文字が「K」より大きく、「Y」より小さい社員の情報を社員番号、名前、業務、給料、部署番号純で出力
SELECT empno,ename,job,sal,deptno
FROM emp
WHERE SUBSTR(ename,1,1)>'K'AND SUBSTR(ename,1,1)<'Y';
--ここのSUBSTR(ename,1,1)は、「SUBSTR(ename：対象となる文字列は'ename'である。」、「1,1：開始位置（頭文字）, 文字の長さ（１文字をとる）」

--５．社員テーブルから社員名に「L」が含まれた名前の位置を出力
SELECT ename,INSTR(ename,'L') e_null,INSTR(ename,'L',1,1) e_11,
             INSTR(ename,'L',1,2) e_12,INSTR(ename,'L',4,1) e_41,
             INSTR(ename,'L',4,2) e_42
FROM emp
ORDER BY ename;

--６．社員テーブルから１０番部署について担当の左のAという文字を削除し、給料の左の1を除去してて出力
SELECT ename,job,LTRIM(job,'A'),sal,LTRIM(sal,1)
FROM emp
WHERE deptno = 10;
--つまり、例えると、ANALYSTはNALYSTになり、SALESMANはそのままSALESMANで、給料12000なら2000になり、9000はそのまま9000。

--７．社員テーブルからJOBのAを$に変更して出力
SELECT ename,job,REPLACE(job,'A','$'),sal
FROM emp;

--８．数次関数四捨五入
SELECT ROUND(4567.678),ROUND(4567.678,0), ROUND(4567.678,2),ROUND(4567.678,-2)
FROM dual;

--９．切り捨て(trunc)
SELECT TRUNC(4567.678),TRUNC(4567.678,0),
       TRUNC(4567.678,2),TRUNC(4567.678,-2)
FROM dual;

--１０．社員テーブルから給料を30で割ってその余りを出力
SELECT sal, MOD(sal,30)
FROM emp
WHERE deptno = 10;

--１１．社員テーブルから、２０番部署中、名前と担当業務を連結して出力。ただし、担当業務を名前から改行させる。
SELECT empno,ename,job,ename || CHR(10) || job
FROM emp
WHERE deptno = 20;
--ここではスクリプト実行で実行する。（CTRL + ENTERではなく、F5）

-- １２．社員テーブルから社員現状を出力。今までの勤務日数が何週何日なのかを出力。勤務日数が多い人順で。
SELECT ename,hiredate,sysdate,sysdate - hiredate "Total Days",
TRUNC((sysdate - hiredate) / 7, 0) Weeks,
ROUND(MOD((sysdate - hiredate), 7), 0) DAYS
FROM emp
ORDER BY sysdate - hiredate DESC;
--同じく、スクリプト実行で実行

--１３．社員テーブルから部署２０中給料前に$を挿入、3桁ごと,を出力。
SELECT empno,ename,job,sal,TO_CHAR(sal,'$999,999') "ドル"
FROM emp
WHERE deptno = 20
ORDER BY sal DESC;