create table users
(
    id         bigint identity
        constraint users_pk
            primary key nonclustered,
    username   varchar(100)       not null,
    email      varchar(100)       not null,
    name       varchar(100)       not null,
    password   varchar(70)        not null,
    role       varchar(20)        not null,
    status     smallint default 0 not null,
    created_at datetime,
    updated_at datetime
)
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


