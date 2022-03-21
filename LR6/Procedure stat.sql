  delimiter //
CREATE PROCEDURE subway_statistics()
BEGIN
CREATE TEMPORARY TABLE IF NOT EXISTS sub_stat
(
id_stat int auto_increment primary key,
id_st int,
count_exits int,
count_exits_avg double default 0,
count_trans int
);
insert into sub_stat (id_st, count_exits)
select station.station_id, count(exit_id) as count_exits from station
left join station_exit on station.station_id=station_exit.station_id group by station.station_id;

update sub_stat set count_exits_avg=(select avg(count_exits) from
(select station.station_id, count(exit_id) as count_exits from station
left join station_exit on station.station_id=station_exit.station_id group by station.station_id));

update sub_stat set count_trans=(select station.station_id, count(station_id_1) as count_trans from station
left join transition on station.station_id=transition.station_id_1 group by station.station_id);

select * from sub_stat;

drop table sub_stat;
END;//
delimiter ;