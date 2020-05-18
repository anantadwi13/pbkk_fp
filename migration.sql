create table users
(
    id         bigint identity
        constraint users_pk
            primary key nonclustered,
    username   varchar(100)  not null,
    email      varchar(100)  not null,
    name       varchar(100)  not null,
    password   varchar(70)   not null,
    role       varchar(20)   not null,
    status     int default 0 not null,
    created_at datetime,
    updated_at datetime
)
go

create table events
(
    id                bigint identity
        constraint schedule_pk
            primary key nonclustered,
    sound_user_id     bigint        not null
        constraint schedule_sound_users_id_fk
            references users,
    amplifier_user_id bigint
        constraint schedule_amplifier_users_id_fk
            references users,
    name              varchar(50)   not null,
    description       text,
    time_start        datetime      not null,
    time_end          datetime      not null,
    location          text,
    rating_sound      smallint,
    rating_amplifier  smallint,
    status            int default 0 not null,
    created_at        datetime,
    updated_at        datetime
)
go

create index events_time_start_time_end_index
    on events (time_start, time_end)
go

create index events_time_start_index
    on events (time_start)
go

create index events_time_end_index
    on events (time_end)
go

create index events_status_index
    on events (status)
go

create table friends
(
    user_id           bigint        not null
        constraint friends_pk
            primary key nonclustered
        constraint friends_users_id_fk
            references users,
    following_user_id bigint        not null
        constraint friends_users_id_fk_2
            references users,
    status            int default 0 not null,
    created_at        datetime,
    updated_at        datetime,
    constraint friends_pk_2
        unique (user_id, following_user_id)
)
go

create index friends_status_index
    on friends (status)
go

create table userdatas
(
    id         bigint not null
        constraint user_data_pk
            primary key nonclustered
        constraint user_data_users_id_fk
            references users
            on update cascade on delete cascade,
    bio        text,
    created_at datetime,
    updated_at datetime
)
go

create unique index users_username_uindex
    on users (username)
go

create unique index users_email_uindex
    on users (email)
go

create index users_status_index
    on users (status)
go


-- challenge
create table competition
(
    idcomp       bigint identity
        constraint competition_pk
            primary key nonclustered,
    title varchar(200)       not null,
    description TEXT       not null,
    duedate     date       not null,
    image   VARCHAR(500)	not null
)
go

create table submission
(
    idsubm       bigint identity
        constraint submission_pk
            primary key nonclustered,
    files varchar(700)       not null,
    idcomp     BIGINT       not null
    	constraint submission_users_idcomp_fk REFERENCES competition
        on UPDATE CASCADE on DELETE CASCADE,
    id   BIGINT	not null
    	constraint submission_users_id_fk REFERENCES users
        on UPDATE CASCADE on DELETE CASCADE
)