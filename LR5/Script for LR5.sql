select line.*, sum(time_to_next) as tr_time from station join line on station.line_id=line.line_id
group by station.line_id
having sum(time_to_next) >= all(select sum(time_to_next) as tr_time from station group by line_id);
 
select line.* from line
where not exists 
(select * from line, station where station_name like 'А%'
and not exists
(select * from line, station as st
where line.line_id=st.line_id));

select station.* from station where closing_time=(select max(closing_time) from station where closing_time<opening_time);

select line.* from line where not exists (select * from station where time_to_next between 1 and 120 and line.line_id=station.line_id);
select line.* from line
left join (select station.line_id from station where time_to_next between 1 and 120) q on line.line_id=q.line_id
where q.line_id is NULL;