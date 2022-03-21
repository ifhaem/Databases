delimiter //
create function count_stations() returns int DETERMINISTIC
BEGIN
declare cnt_st int DEFAULT 0;
set cnt_st=(select ifnull(count(station_id), 0) from station);
return cnt_st;
END;//

select count_stations();