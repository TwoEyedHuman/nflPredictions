select pred.winner, round(count(*)/count(distinct(pred.seed))) as wins, 16 - round(count(*)/count(distinct(pred.seed))) as losses
from game_predictions as pred
where pred.method_id = 1
group by 1
order by count(*)/count(distinct(pred.seed)) desc
;