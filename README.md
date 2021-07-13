# Sample Liquibase

Sample project to demonstrate database versioning using liquibase with SQL

## Dependencies

- java 11
- maven
- mariadb

## Basic usage

Spring boot will automatically bootstrap liquibase from application startup. It will rely on datasource configured into
`application.properties` and look into `liquibase.properties` for root **changelog** file.

In this sample I decided to use the xml version of it.

Instead of various changesets entries, a folder called changelogs will contain properly formatted sql files where the 
desired change is stored. That way the database evolution gets more similar to what i saw on other migration solutions.

### up and down migrations

On the other hand, if you desire to manually up and down migration files, the liquibase-maven-plugin add goals such as:

- `mvn liquibase:update`
- `mvn liquibase:rollback -Dliquibase.rollbackCount=1`

That way if your migration supports rollback you can test it up and down without the need of running the application. 

### sample migration

The sql liquibase migration looks like this:

```sql
-- liquibase formatted sql
-- changeset sombriks:2021-07-13-17-31-01_create-table-pets.sql
create table pets(
    id integer not null primary key auto_increment,
    name varchar(255) not null
);
-- rollback drop table pets;
```

The two first comments are **mandatory**. It must have one or more `-- changeset` comments containing an username and an
unique id. More info [here](https://docs.liquibase.com/workflows/liquibase-community/migrate-with-sql.html).

The rollback comment can span for more than one line if needed

The script `makemigrate.sh` is a little helper just to add migration files in the correct folder. Usage:

```bash
$ ./makemigrate.sh add-pet-color
New file created:
src/main/resources/db/changelogs/2021-07-13-20-41-52_add-pet-color.sql
```

Once the file is edited, **build the project** and then maven targets can help to apply the migration.

## Reference Documentation

For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/2.5.2/maven-plugin/reference/html/)
* [Create an OCI image](https://docs.spring.io/spring-boot/docs/2.5.2/maven-plugin/reference/html/#build-image)
* [Spring Data JPA](https://docs.spring.io/spring-boot/docs/2.5.2/reference/htmlsingle/#boot-features-jpa-and-spring-data)
* [Liquibase Migration](https://docs.spring.io/spring-boot/docs/2.5.2/reference/htmlsingle/#howto-execute-liquibase-database-migrations-on-startup)
* [Spring Boot DevTools](https://docs.spring.io/spring-boot/docs/2.5.2/reference/htmlsingle/#using-boot-devtools)
* [Spring Web](https://docs.spring.io/spring-boot/docs/2.5.2/reference/htmlsingle/#boot-features-developing-web-applications)
* [Liquibase includeAll issue](https://github.com/liquibase/liquibase/issues/1436)
* [Liquibase SQL changesets](https://docs.liquibase.com/concepts/basic/sql-format.html)

## Guides

The following guides illustrate how to use some features concretely:

* [Accessing Data with JPA](https://spring.io/guides/gs/accessing-data-jpa/)
* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/bookmarks/)

