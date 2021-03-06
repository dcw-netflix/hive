SET hive.vectorized.execution.enabled=true;
drop table char_2;

create table char_2 (
  key varchar(10),
  value varchar(20)
) stored as orc;

insert overwrite table char_2 select * from src;

select key, value
from src
order by key asc
limit 5;

explain select key, value
from char_2
order by key asc
limit 5;

-- should match the query from src
select key, value
from char_2
order by key asc
limit 5;

select key, value
from src
order by key desc
limit 5;

explain select key, value
from char_2
order by key desc
limit 5;

-- should match the query from src
select key, value
from char_2
order by key desc
limit 5;

drop table char_2;
