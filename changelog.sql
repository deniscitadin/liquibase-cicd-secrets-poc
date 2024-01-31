--changeset denis:1

create type email_template_type as enum ('generic', 'magic_link');

alter type email_template_type owner to firefly_dev_developer;

create type recipient_type as enum ('To', 'Cc', 'Bcc');

alter type recipient_type owner to firefly_dev_developer;

create table users
(
    id             uuid                  not null
        constraint users_pk
            primary key,
    email          varchar               not null,
    password       varchar               not null,
    salt           varchar,
    disabled       boolean default false not null,
    magic_link     varchar,
    last_logged_in timestamp,
    token          varchar
);
