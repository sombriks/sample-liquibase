-- liquibase formatted sql
-- changeset sombriks:2021-07-13-20-41-52_add-pet-color.sql

alter table pets add column color varchar(255) not null default 'brown';

-- rollback alter table pets drop column color;
