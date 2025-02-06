SELECT e.employee_ID, e.name
FROM employee_information e
JOIN last_quarter_bonus b ON b.employee_ID = e.employee_ID
WHERE e.division LIKE 'HR'
AND b.bonus >= 5000;
