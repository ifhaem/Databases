  delimiter //
CREATE PROCEDURE ins_station (num_line int, station_name_ varchar(30),
opening_time_ time, closing_time_ time, opening_date_ date, time_to_next_ int)
BEGIN
declare id_ln_new int;
declare id_st_new int;
if exists(select * from line where line_number=num_line)
	then select line_id into id_ln_new from line where line_number=num_line;
    else begin
    set id_ln_new=(select ifnull(max(line_id)+1,0) from line);
    INSERT INTO line(line_id, line_number) VALUES (id_ln_new, num_line);
			end;
	end if;
    set id_st_new=(select ifnull(max(station_id)+1,0) from station);
insert into station (station_id, line_id, station_name, opening_time, closing_time,
opening_date, time_to_next)
VALUES (id_st_new, id_ln_new, station_name_, opening_time_, closing_time_,
opening_date_, time_to_next_);
END;//
delimiter ;