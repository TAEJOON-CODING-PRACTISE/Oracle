--１．社員IDが200以上の社員のすべての情報をID中心で昇順整列。
SELECT * FROM employees
WHERE employee_id >= 200
ORDER BY employee_id ASC;

--２．社員IDが200以上の社員のすべての情報をID中心で降順整列。
SELECT * FROM employees
WHERE employee_id >= 200
ORDER BY employee_id DESC;

--３．社員IDが200以上の社員のすべての情報をファーストネーム中心で昇順整列。
SELECT * FROM employees
WHERE employee_id >= 200
ORDER BY first_name ASC;

