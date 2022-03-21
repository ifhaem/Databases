  delimiter //
CREATE PROCEDURE del_station_clear_line(id_st_del int)
BEGIN
declare id_ln_del int;
select line_id into id_ln_del from station where station_id=id_st_del;
delete from station where station_id=id_st_del;
if not exists(select * from station where line_id=id_ln_del)
then delete from line where line_id=id_ln_del;
end if;
END;//
delimiter ;