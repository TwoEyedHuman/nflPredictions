drop table if exists method1_probs;

create table method1_probs (
	team char(3),
    score decimal(10, 1),
    primary key (team)
);

insert into method1_probs values ('HOU',0.7);
insert into method1_probs values ('CHI',0.2);
insert into method1_probs values ('CLE',0.2);
insert into method1_probs values ('GB',0.8);
insert into method1_probs values ('IND',0.6);
insert into method1_probs values ('LV',0.4);
insert into method1_probs values ('MIA',0.1);
insert into method1_probs values ('NYJ',0.15);
insert into method1_probs values ('PHI',0.6);
insert into method1_probs values ('SEA',0.8);
insert into method1_probs values ('LAC',0.3);
insert into method1_probs values ('ARI',0.5);
insert into method1_probs values ('TB',0.6);
insert into method1_probs values ('DAL',0.7);
insert into method1_probs values ('PIT',0.6);
insert into method1_probs values ('TEN',0.8);
insert into method1_probs values ('CIN',0.3);
insert into method1_probs values ('ATL',0.4);
insert into method1_probs values ('BUF',0.6);
insert into method1_probs values ('CAR',0.2);
insert into method1_probs values ('DEN',0.1);
insert into method1_probs values ('DET',0.2);
insert into method1_probs values ('JAC',0.1);
insert into method1_probs values ('LAR',0.5);
insert into method1_probs values ('MIN',0.8);
insert into method1_probs values ('NYG',0.1);
insert into method1_probs values ('SF',0.7);
insert into method1_probs values ('WFT',0.2);
insert into method1_probs values ('BAL',0.9);
insert into method1_probs values ('KC',0.9);
insert into method1_probs values ('NE',0.4);
insert into method1_probs values ('NO',0.6);