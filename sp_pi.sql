--liquibase formatted CREATE CUSTOMERCARE TABLE
--changeset Kumar:19999 endDelimiter:""

create or replace procedure sp_pi()
    returns float not null
    language javascript
    as
    $$
    return 3.1415926;
    $$
    