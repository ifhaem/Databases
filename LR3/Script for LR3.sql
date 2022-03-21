insert line set line_id=6, line_number=6, color="Коричневая", travel_time="00:14";
update transition set transition_time=transition_time+10 where transition_id=1;
delete from station_exit where exit_id=33;
update station set opening_time=opening_time-10 where station_id=1;