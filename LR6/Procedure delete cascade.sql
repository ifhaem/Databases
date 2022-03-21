  delimiter //
CREATE PROCEDURE del_line_cascade(id_ln_del int)
BEGIN
delete from station_exit where station_id in
	(select station_id from station where line_id=id_ln_del);
delete from transition where station_id_1 in
	(select station_id from station where line_id=id_ln_del);
delete from transition where station_id_2 in
	(select station_id from station where line_id=id_ln_del);
delete from station where line_id=id_ln_del;
delete from line where line_id=id_ln_del;
END;//
delimiter ;