WITH difference AS(
    select * DATEDIFF(minute, lag(dt) over (order by sender,dt),dt) as diff_minute,
    row_number() over (order by sender, dt) as rownumber
    from transactions
    --order by sender,dt
),
rn as (
    select rownumber from difference
    where rownumber IN(
        select rownumber from transactions
        where abs(diff_minute) < 60
    )
    --order by sender,dt
),
sequences as (
    select * from difference
    where rownumber IN(
        select rownumber from rn
        union
        select rownumber - 1 as rownumber 
        from rn
    )
    --order by sender,dt 
)
select sender, MIN(dt) as sequence_start, MAX(dt) as sequence_end,
count(rownumber) as transactions_count,
SUM(amount) as transactions_sum
from sequences 
GROUP BY sender
HAVING SUM(amount) >= 150
ORDER BY sender, MIN(dt), MAX(dt);
