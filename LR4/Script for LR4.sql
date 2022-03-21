select * from station where station_name like '%ая %';
select station.* from station, station_exit where station_exit.station_id=station.station_id and station_exit.exit_street='-';
select station_in.* from transition
inner join station as station_in on station_in.station_id=transition.station_id_1
inner join line as line_in on line_in.line_id=station_in.line_id
inner join station as station_to on station_to.station_id=transition.station_id_2
inner join line as line_to on line_to.line_id=station_to.line_id
where line_in.line_number=2 and line_to.line_number=4;