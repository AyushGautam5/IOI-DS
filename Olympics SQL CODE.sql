use project;

select *
from olympics;

select name,medal
from olympics;

select count(distinct name)
from olympics;

select distinct(name),medal
from olympics
where medal = 'gold';

select distinct(name),medal,year
from olympics
where medal ='silver'
order by year;

select team,medal
from olympics
where medal = 'gold'
group by team
having count(medal) > '50';

select name,count(medal)
from olympics
group by name
order by count(medal) Desc
limit 1;

select event
from olympics
where event like '%freestyle%';

select name,count(medal),year
from olympics
group by name,year
having count(medal) > 1;

select team,count(distinct(season)),medal
from olympics
where medal = 'gold'
group by team
having count(distinct(season)) = '2';

select team,(count(medal)/count(distinct(name))) as average
from olympics
group by team;

select count(distinct(sport)) as diff_sports,team
from olympics
group by team
having count(distinct(sport)) > 10; 

select team,
sum(case when medal = 'gold' then 1 else 0 end) as gold_medal,
sum(case when medal = 'silver' then 1 else 0 end) as silver_medal,
sum(case when medal = 'bronze' then 1 else 0 end) as bronze_medal 
from olympics
group by team
having gold_medal != '0' or silver_medal != '0' or bronze_medal != '0';


select max(year) - min(year) as year_diff,team
from olympics
where medal != '0'
group by team;

select distinct(name),event,
sum(case when medal = 'silver' then 1 else 0 end) as silver_count,
sum(case when medal = 'gold' then 1 else 0 end) as gold_count
from olympics
group by event,name
having silver_count != '0'and gold_count != '0';








