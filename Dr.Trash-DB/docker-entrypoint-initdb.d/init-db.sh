#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER backend;
    CREATE DATABASE dr_trash;
    GRANT ALL PRIVILEGES ON DATABASE dr_trash TO backend;

    USE DATABASE dr_trash;

    CREATE TABLE user (
        id SERIAL,
        name VARCHAR(32) NOT NULL,
        image_uri VARCHAR(256) NOT NULL,
        point INTEGER NOT NULL,

        PRIMARY KEY (id)
    );

    CREATE TABLE oauth (
        user_id INTEGER NOT NULL,
        provider VARCHAR(32) NOT NULL,
        id VARCHAR(128) NOT NULL,

        PRIMARY KEY (provider, id)
    );

    CREATE TABLE trashcan (
        id SERIAL,
        manager_id INTEGER,
        name VARCHAR(32),
        description VARCHAR(256),
        latitude FLOAT,
        longitude FLOAT,
        created_at TIMESTAMP NOT NULL DEFAULT NOW(),

        PRIMARY KEY (id),
        FOREIGN KEY (manager_id) REFERENCES user(id)
    );

    CREATE TABLE article (
        id SERIAL,
        author_id INTEGER NOT NULL,
        title VARCHAR(32) NOT NULL,
        content VARCHAR(1024) NOT NULL,
        like_count INTEGER NOT NULL DEFAULT 0,
        view_count INTEGER NOT NULL DEFAULT 0,
        hate_count INTEGER NOT NULL DEFAULT 0,
        created_at TIMESTAMP NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

        PRIMARY KEY (id),
        FOREIGN KEY (author_id) REFERENCES user(id)
    );

    CREATE TABLE comment (
        id SERIAL,
        author_id INTEGER NOT NULL,
        article_id INTEGER NOT NULL,
        content VARCHAR(1024) NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
        like_count INTEGER NOT NULL DEFAULT 0,
        hate_count INTEGER NOT NULL DEFAULT 0,

        PRIMARY KEY (id),
        FOREIGN KEY (author_id) REFERENCES user(id),
        FOREIGN KEY (article_id) REFERENCES article(id)
    );

    CREATE TABLE achievement (
        id SERIAL,
        name VARCHAR(32) NOT NULL,
        description VARCHAR(256) NOT NULL,
        image_uri VARCHAR(256) NOT NULL,

        PRIMARY KEY (id)
    );

    CREATE TABLE achiever (
        user_id INTEGER NOT NULL,
        achievement_id INTEGER NOT NULL,
        achieved_at TIMESTAMP NOT NULL DEFAULT NOW(),

        PRIMARY KEY (user_id, achievement_id),
        FOREIGN KEY (user_id) REFERENCES user(id),
        FOREIGN KEY (achievement_id) REFERENCES achievement(id)
    );

EOSQL
