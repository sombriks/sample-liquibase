# helper script to create new migrate file
NEW_MIGRATE="$(date '+%Y-%m-%d-%H-%M-%S')_$1.sql"
echo "New file created:
src/main/resources/db/changelogs/$NEW_MIGRATE
"

cat << EOF > src/main/resources/db/changelogs/$NEW_MIGRATE
-- liquibase formatted sql
-- changeset $USER:$NEW_MIGRATE
create table pets(
    id integer not null primary key auto_increment,
    name varchar(255) not null
);
-- rollback drop table pets;
EOF
