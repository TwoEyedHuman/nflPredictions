with results as (
	select res.winner
		,res.wins
		,ntc.conference
		,ntc.division
		,row_number() over (partition by ntc.conference, ntc.division order by res.wins desc) as division_rank
		,row_number() over (partition by ntc.conference order by res.wins desc) as conference_rank
	from (
		select case when res_20.winner is not null then res_20.winner else pred.winner end as winner
			,count(*)/count(distinct(pred.seed)) as wins
			,16 - count(*)/count(distinct(pred.seed)) as losses
		from game_predictions as pred
        left join nfl_2020_results as res_20
        on pred.game_id = res_20.game_id
		left join nfl_team_characteristics as ntc
		on pred.winner = ntc.team
		where pred.method_id = 1
		group by 1
	) as res
	left join nfl_team_characteristics as ntc
	on res.winner = ntc.team
)
select rnk.winner
	,rnk.conference
    ,"Division Winner" as placement
    ,row_number() over (partition by rnk.conference order by rnk.wins desc) as playoff_rank
from results as rnk
where rnk.division_rank = 1
union all
select winner, conference, placement, 4+row_number() over (partition by conference order by wins desc) as playoff_rank
from (
	select rnk.winner
		,rnk.conference
        ,rnk.wins
		,row_number() over (partition by rnk.conference order by rnk.wins desc) as wildcard_rank
		,"Wilcard" as placement
	from results as rnk
	where rnk.division_rank > 1
) as rnk2
where rnk2.wildcard_rank in (1,2)
order by conference, playoff_rank asc
;