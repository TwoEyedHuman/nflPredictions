drop table if exists nfl_team_characteristics;

create table nfl_team_characteristics (
	team char(3),
    division char(5),
    conference char(3),
    primary key (team)
);

insert into nfl_team_characteristics values ('KC','WEST','AFC');
insert into nfl_team_characteristics values ('BAL','NORTH','AFC');
insert into nfl_team_characteristics values ('SF','WEST','NFC');
insert into nfl_team_characteristics values ('NO','SOUTH','NFC');
insert into nfl_team_characteristics values ('SEA','WEST','NFC');
insert into nfl_team_characteristics values ('GB','NORTH','NFC');
insert into nfl_team_characteristics values ('TB','SOUTH','NFC');
insert into nfl_team_characteristics values ('TEN','SOUTH','NFC');
insert into nfl_team_characteristics values ('MIN','NORTH','NFC');
insert into nfl_team_characteristics values ('DAL','EAST','NFC');
insert into nfl_team_characteristics values ('BUF','EAST','AFC');
insert into nfl_team_characteristics values ('PHI','EAST','NFC');
insert into nfl_team_characteristics values ('IND','SOUTH','AFC');
insert into nfl_team_characteristics values ('PIT','NORTH','AFC');
insert into nfl_team_characteristics values ('NE','EAST','AFC');
insert into nfl_team_characteristics values ('HOU','SOUTH','AFC');
insert into nfl_team_characteristics values ('LAR','WEST','NFC');
insert into nfl_team_characteristics values ('ATL','SOUTH','NFC');
insert into nfl_team_characteristics values ('ARI','WEST','NFC');
insert into nfl_team_characteristics values ('CLE','NORTH','AFC');
insert into nfl_team_characteristics values ('CHI','NORTH','NFC');
insert into nfl_team_characteristics values ('LV','WEST','AFC');
insert into nfl_team_characteristics values ('DEN','WEST','AFC');
insert into nfl_team_characteristics values ('LAC','WEST','AFC');
insert into nfl_team_characteristics values ('MIA','EAST','AFC');
insert into nfl_team_characteristics values ('NYJ','EAST','AFC');
insert into nfl_team_characteristics values ('CAR','SOUTH','NFC');
insert into nfl_team_characteristics values ('DET','NORTH','NFC');
insert into nfl_team_characteristics values ('NYG','EAST','NFC');
insert into nfl_team_characteristics values ('CIN','NORTH','AFC');
insert into nfl_team_characteristics values ('WFT','EAST','NFC');
insert into nfl_team_characteristics values ('JAC','SOUTH','AFC');