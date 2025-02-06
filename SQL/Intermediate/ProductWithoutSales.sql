SELECT a.sku, a.product_name
from product a
WHERE a.id NOT IN (
    SELECT product_id from invoice_item)
    ORDER BY a.sku ASC;
