/*==============================================================*/
/* Table: Line                                                  */
/*==============================================================*/
create table Line
(
   line_id              int not null,
   line_number          int not null,
   color                varchar(15),
   travel_time          time,
   primary key (line_id)
);

/*==============================================================*/
/* Table: Station                                               */
/*==============================================================*/
create table Station 
(
   station_id           int not null,
   line_id              int,
   station_name         varchar(30) not null,
   opening_time         time,
   closing_time         time,
   opening_date         date,
   time_to_next         int,
   primary key (station_id),
   foreign key (line_id) references Line (line_id) on delete restrict on update restrict
);

/*==============================================================*/
/* Table: Station_Exit                                          */
/*==============================================================*/
create table Station_Exit
(
   exit_id              int not null,
   station_id           int,
   exit_street          varchar(30),
   building_number      varchar(6),
   primary key (exit_id),
   foreign key(station_id) references Station (station_id) on delete set null on update restrict
);

/*==============================================================*/
/* Table: Transition                                            */
/*==============================================================*/
create table Transition
(
   transition_id		int not null,
   station_id_1         int,
   station_id_2         int,
   transition_time      int,
   primary key (transition_id),
   foreign key (station_id_1) references Station (station_id) on delete set null on update cascade,
   foreign key (station_id_2) references Station (station_id) on delete set null on update cascade
);
