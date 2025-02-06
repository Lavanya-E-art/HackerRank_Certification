SELECT u.id, u.first_name, u.last_name, c.id, c.customer_name, COUNT(*)
from contact con
INNER JOIN customer c ON c.id = con.customer_id
INNER JOIN user_account u ON u.id = con.user_account_id
GROUP BY u.id, u.first_name, u.last_name, c.id, c.customer_name
HAVING COUNT(*) > 1
ORDER BY u.id ASC;
