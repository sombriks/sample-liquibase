--liquibase formatted sql
--changeset sombriks:2021-07-13-17-31-01_create-table-pets.sql
create table pets(
    id integer not null primary key auto_increment,
    name varchar(255) not null
);
--rollback drop table pets;
