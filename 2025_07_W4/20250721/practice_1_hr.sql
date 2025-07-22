--社員のすべての情報を出力
SELECT * FROM EMPLOYEES;

--社員名（下の名前）がStevenである人のすべての情報項目を出力
SELECT * FROM EMPLOYESS
WHERE first_name = 'Steven';

--社員情報テーブル項目現行確認 (sqlplus / sql developer)
--sqlplus用
--DESC[RIBE] employees;
--sql developer用
DESC employees;

--社員名がStevenである社員のフルネームを出力
--first_nameとlast_nameを半角スペースでつなぐ。
SELECT first_name || ' ' || last_name FROM employees
WHERE first_name = 'Steven';

--上の質疑（Query）で、「名前」という別称（alias）を添加して出力。
--注意：文字列連結の演算子（オペレーター）に注意！
SELECT first_name || ' ' || last_name AS "名前" FROM employees
WHERE first_name = 'Steven';
--こうすることで、「FIRST_NAME||''||LAST_NAME」という風に表示されてたところが「名前」で表示されるようになる。

--Steven社員の給与に10,000$を追加して、「10,000$追加分」という別称で出力
SELECT salary+10000 "10,000$追加分" FROM employees
WHERE first_name = 'Steven';

--社員現状からファーストネームだけを被らないように出力
SELECT DISTINCT first_name FROM employees;

--社員IDが150より大きい社員の名前を「名前」という別称で出力
SELECT first_name || ' ' || last_name "名前" FROM employees
WHERE employee_id > 150;

--社員のIDが150~170の社員のファーストネームを出力
SELECT first_name FROM employees
WHERE employee_id <= 170 AND employee_id >= 150;

--社員名が「D」から始まる社員のファーストネームを出力(類似検索)
SELECT first_name FROM employees
WHERE first_name LIKE 'D%';

--社員名が「D」から始まる社員のファーストネームを出力(同一検索)
SELECT first_name FROM employees
WHERE first_name = 'D%';  --結果ナシ。
--この場合、ファーストネームが「D%」という社員を検索するので、存在しない社員を探すようになるので、空欄が出力される。

--社員IDが150~170の社員のE-mail現状を出力しなさい。
SELECT email "メール" FROM employees
WHERE employee_id <= 170 AND employee_id >= 150;

--同じく、
SELECT email "メール" FROM employees
WHERE employee_id BETWEEN 150 AND 170;