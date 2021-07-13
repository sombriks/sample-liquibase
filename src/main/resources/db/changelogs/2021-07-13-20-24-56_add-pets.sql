-- liquibase formatted sql
-- changeset sombriks:2021-07-13-20-24-56_add-pets.sql

-- loading initial and known state into database
insert into pets(id,name) values (1,'duck');
insert into pets(id,name) values (2,'dog');
insert into pets(id,name) values (3,'cat');

-- rollback delete from pets;
