drop table if exists nfl_2020_results;
create table nfl_2020_results (
	game_id int,
    winner char(3),
    primary key (game_id),
    foreign key (game_id) references nfl_schedule(game_id),
    foreign key (winner) references nfl_team_characteristics(team)
);

insert into nfl_2020_results values(1,'KC');
insert into nfl_2020_results values(2,'CHI');
insert into nfl_2020_results values(3,'BAL');
insert into nfl_2020_results values(4,'GB');
insert into nfl_2020_results values(5,'JAC');
insert into nfl_2020_results values(6,'LV');
insert into nfl_2020_results values(7,'NE');
insert into nfl_2020_results values(8,'BUF');
insert into nfl_2020_results values(9,'WFT');
insert into nfl_2020_results values(10,'SEA');
insert into nfl_2020_results values(11,'LAC');
insert into nfl_2020_results values(12,'ARI');
insert into nfl_2020_results values(13,'NO');
insert into nfl_2020_results values(14,'LAR');
insert into nfl_2020_results values(15,'PIT');
insert into nfl_2020_results values(16,'TEN');
insert into nfl_2020_results values(17,'CLE');